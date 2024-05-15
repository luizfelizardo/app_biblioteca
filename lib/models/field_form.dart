import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class fieldForm extends StatelessWidget {
  String label;
  bool isPassword;
  TextEditingController controller;
  bool? isForm = true;
  bool? isemail = false;

  fieldForm(
      {required this.label,
      required this.isPassword,
      required this.controller,
      this.isForm,
      this.isemail,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isForm,
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Por favor, insira um valor';
        }
        return null;
        // ignore: dead_code
        if (isemail == false) {
          if (!value.contains('@')) {
            // não está funcionando verificar o erro !!!
            return 'Por favor, insira um email válido';
          }
        }
      },
    );
  }
}
