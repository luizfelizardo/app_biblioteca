// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:biblioteca_uniceu_alvarenga/models/field_form.dart';
import 'package:biblioteca_uniceu_alvarenga/models/user.dart';
import 'package:biblioteca_uniceu_alvarenga/models/user_provider.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  String title = "Cadastrar Usuários";

  TextEditingController controllername = TextEditingController();
  TextEditingController controlleraddress = TextEditingController();
  TextEditingController controlleremail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = UserProvider.of(context) as UserProvider;

    int? index;
    if (userProvider.indexUser != null) {
      index = userProvider.indexUser;
      controllername.text = userProvider.userSelected!.name;
      controlleraddress.text = userProvider.userSelected!.address;
      controlleremail.text = userProvider.userSelected!.email;
      controllerPassword.text = userProvider.userSelected!.password;

      setState(() {
        title = "Editar Usuário";
      });
    }

    void save() {
      User user = User(
          name: controllername.text,
          address: controlleraddress.text,
          email: controlleremail.text,
          password: controllerPassword.text);

      if (index != null) {
        userProvider.users[index] = user;
      } else {
        int usersLength = userProvider.users.length;

        //salva um novo usuario
        userProvider.users.insert(usersLength, user);
      }
      Navigator.popAndPushNamed(context, "/create");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 250, 232, 248),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: TextButton(
              onPressed: (() {
                Navigator.popAndPushNamed(context, "/List");
              }),
              child: const Text('Lista Usuários'),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            fieldForm(
              label: 'nome:',
              isPassword: false,
              controller: controllername,
            ),
            fieldForm(
              label: 'Endereço:',
              isPassword: false,
              controller: controlleraddress,
            ),
            fieldForm(
              label: 'Email:',
              isPassword: false,
              controller: controlleremail,
            ),
            fieldForm(
              label: 'Senha:',
              isPassword: true,
              controller: controllerPassword,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: save,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: const Text('Salvar'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
