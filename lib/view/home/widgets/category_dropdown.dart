import 'package:flutter/material.dart';
import 'package:productapp/controller/home_provider.dart';
import 'package:provider/provider.dart';

class CategoryDropdown extends StatelessWidget {
  const CategoryDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryprovider =
        Provider.of<CategoryProvider>(context, listen: false);
    return Consumer<CategoryProvider>(
      builder: (context, value, child) {
        final categoryList = value.categoryList;
        String? dropdownValue;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: categoryprovider.categoryController,
            decoration: InputDecoration(
              hintText: "Select Category",
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
                      final selectedCategory = categoryList.firstWhere(
                        (category) => category.catgName == newValue,
                      );
                      dropdownValue = newValue;
                      categoryprovider.categoryController.text = newValue;
                      categoryprovider.fetchProducts(selectedCategory.id);
                                        }
                  },
                  items: categoryList
                      .map((category) {
                        return DropdownMenuItem<String>(
                          value: category.catgName,
                          child: Text(category.catgName),
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
