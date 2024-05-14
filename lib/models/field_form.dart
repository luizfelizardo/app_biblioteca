import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class fieldForm extends StatelessWidget {
  String label;
  bool isPassword;
  TextEditingController controller;
  bool? isForm = true;

  fieldForm(
      {required this.label,
      required this.isPassword,
      required this.controller,
      this.isForm,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: this.isForm,
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
