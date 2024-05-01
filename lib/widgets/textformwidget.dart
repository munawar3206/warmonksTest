import 'package:flutter/material.dart';

class Textformwidget extends StatelessWidget {
  const Textformwidget({
    super.key,
    required this.hinttext,
  });
  final String hinttext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: TextField(
        decoration: InputDecoration(
          hintText: hinttext,
          filled: true,
          fillColor: const Color.fromARGB(255, 227, 246, 255),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
