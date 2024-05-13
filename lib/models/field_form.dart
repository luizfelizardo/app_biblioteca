import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class fieldForm extends StatelessWidget {
  String label;
  bool isPassword;
  TextEditingController controller;

  fieldForm(
      {required this.label,
      required this.isPassword,
      required this.controller,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label,
      ),
    );
  }
}
