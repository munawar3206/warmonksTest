import 'package:flutter/material.dart';
import 'package:productapp/controller/home_provider.dart';
import 'package:provider/provider.dart';

class ProductDropdown extends StatelessWidget {
  const ProductDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryprovider =
        Provider.of<CategoryProvider>(context, listen: false);
    return Consumer<CategoryProvider>(
      builder: (context, value, child) {
        final productList = value.productList;
        String? dropdownValue;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: categoryprovider.productController,
            decoration: InputDecoration(
              hintText: "Select Product",
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
                      final selectedProduct = productList.firstWhere(
                        (product) => product.name == newValue,
                      );
                      dropdownValue = newValue;
                      categoryprovider.productController.text = newValue;
                      final selectedProductId = int.parse(selectedProduct.id);
                      categoryprovider.fetchBrand(selectedProductId);
                                        }
                  },
                  items: productList
                      .map((product) {
                        return DropdownMenuItem<String>(
                          value: product.name,
                          child: Text(product.name),
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
