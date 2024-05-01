import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:productapp/controller/category_provider.dart';
import 'package:productapp/model/category_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isContainerVisible = false;
  String? dropdownValue;
  TextEditingController categoryController = TextEditingController();
  TextEditingController productController = TextEditingController();
  TextEditingController brandController = TextEditingController();

  @override
  @override
  void initState() {
    super.initState();
    Provider.of<CategoryProvider>(context, listen: false).fetchcategory();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const textformwidget(),
                const textformwidget(),
                const textformwidget(),
                const SizedBox(
                  height: 10,
                ),
                _isContainerVisible
                    ? Container(
                        height: 250,
                        width: 300,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Consumer<CategoryProvider>(
                                        builder: (context, value, child) {
                                          log(dropdownValue ?? "");

                                          final categoryList =
                                              value.categoryList;
                                          return TextFormField(
                                            controller: categoryController,
                                            decoration: InputDecoration(
                                              hintText: "Select Category",
                                              filled: true,
                                              fillColor: Color.fromARGB(
                                                  255, 239, 232, 232),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              suffixIcon:
                                                  DropdownButton<String>(
                                                // value: dropdownValue,
                                                icon: const Icon(Icons
                                                    .keyboard_arrow_down_sharp),
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    dropdownValue = newValue!;
                                                    categoryController.text =
                                                        newValue;
                                                                                                     Datum selectedItem =
                                                        categoryList.firstWhere(
                                                      (item) =>
                                                          item.catgName ==
                                                          newValue,
                                                    );
                                                    if (selectedItem != null) {
                                                  
                                                      log(selectedItem.id
                                                          .toString());
                                                    }
                                                  });
                                                },

                                                items: categoryList
                                                    .map((category) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value:
                                                            category.catgName,
                                                        child: Text(
                                                            category.catgName),
                                                      );
                                                    })
                                                    .toSet()
                                                    .toList(),
                                              ),
                                            ),
                                            readOnly: true,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextButton.icon(
                            onPressed: () {
                              setState(() {
                                _isContainerVisible = true;
                              });
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                            label: const Text(
                              "Add",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete,
                              color: Color.fromARGB(255, 255, 2, 2),
                            ),
                            label: const Text(
                              "Remove",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                ),
           
                const textformwidget(),
                const textformwidget(),
                const textformwidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class textformwidget extends StatelessWidget {
  const textformwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 15),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(255, 239, 232, 232),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
