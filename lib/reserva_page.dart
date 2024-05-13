import 'package:flutter/material.dart';
import 'package:biblioteca_uniceu_alvarenga/models/user_form.dart';
import 'package:biblioteca_uniceu_alvarenga/models/user_list.dart';
import 'package:biblioteca_uniceu_alvarenga/models/user_provider.dart';

// ignore: camel_case_types
class reservaPage extends StatelessWidget {
  const reservaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      child: MaterialApp(
        title: 'CRUD APP',
        home: const UserForm(),
        routes: {
          "/create": (_) => const UserForm(),
          "/List": (_) => const UserList(),
        },

        //lista de usuarios
      ),
    );
  }
}
