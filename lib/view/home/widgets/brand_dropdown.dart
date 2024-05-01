import 'package:flutter/material.dart';
import 'package:productapp/controller/home_provider.dart';
import 'package:productapp/model/BrandModel.dart';
import 'package:provider/provider.dart';

class BrandDropdown extends StatelessWidget {
  const BrandDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryprovider =
        Provider.of<CategoryProvider>(context, listen: false);
    return Consumer<CategoryProvider>(
      builder: (context, value, child) {
        final brandList = value.BrandList;
        String? dropdownValue;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: categoryprovider.brandController,
            decoration: InputDecoration(
              hintText: "Select Brand",
              filled: true,
              fillColor: const Color.fromARGB(255, 227, 246, 255),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              suffixIcon: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  icon: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.keyboard_arrow_down_sharp),
                  ),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      dropdownValue = newValue;
                      categoryprovider.brandController.text = newValue;
                      Brand selectedItem = brandList.firstWhere(
                        (item) => item.brand == newValue,
                      );
                     
                    }
                  },
                  items: brandList
                      .map((brand) {
                        return DropdownMenuItem<String>(
                          value: brand.brand,
                          child: Text(brand.brand),
                        );
                      })
                      .toSet()
                      .toList(),
                ),
              ),
            ),
            readOnly: true,
          ),
        );
      },
    );
  }
}
