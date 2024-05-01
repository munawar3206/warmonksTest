import 'package:flutter/material.dart';
import 'package:productapp/view/home/widgets/brand_dropdown.dart';
import 'package:productapp/view/home/widgets/category_dropdown.dart';
import 'package:productapp/view/home/widgets/product_dropdown.dart';
import 'package:productapp/widgets/textformwidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> containers = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        "assets/tri.png",
                        height: 80,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.menu,
                            size: 30,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      "Enquiry Form",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                    ),
                  ),
                ],
              ),
              const Textformwidget(
                hinttext: "Place",
              ),
              const Textformwidget(
                hinttext: "Contact Number",
              ),
              const Textformwidget(
                hinttext: "Reference Number",
              ),
              const Textformwidget(
                hinttext: "Business-Type",
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: containers,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton.icon(
                        onPressed: () {
                          setState(() {
                            containers.add(
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.red),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Column(
                                    children: [
                                      CategoryDropdown(),
                                      ProductDropdown(),
                                      BrandDropdown(),
                                    ],
                                  ),
                                ),
                              ),
                            );
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
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Visibility(
                      visible: containers.isNotEmpty,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton.icon(
                          onPressed: () {
                            setState(() {
                              containers.removeLast();
                            });
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Color.fromARGB(255, 255, 2, 2),
                          ),
                          label: const Text(
                            "Remove",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Textformwidget(
                hinttext: "Occupation",
              ),
              const Textformwidget(
                hinttext: "Requirement",
              ),
              const Textformwidget(
                hinttext: "Source of Enquiry",
              ),
              const Textformwidget(
                hinttext: "C/o of enquiry",
              ),
              const Textformwidget(
                hinttext: "Remarks",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
