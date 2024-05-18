// ignore_for_file: unused_local_variable

import 'package:biblioteca_uniceu_alvarenga/container_all.dart';
import 'package:flutter/material.dart';
import 'package:biblioteca_uniceu_alvarenga/models/field_form.dart';
//import 'package:biblioteca_uniceu_alvarenga/models/user.dart';
import 'package:biblioteca_uniceu_alvarenga/models/user_provider.dart';
//import 'package:biblioteca_uniceu_alvarenga/models/user_view.dart';

// ignore: must_be_immutable
class UserView extends StatelessWidget {
  UserView({super.key});

  String title = "Visualizar Usuário";

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
      body: ContainerAll(
        child: Center(
          child: Column(
            children: [
              fieldForm(
                label: 'nome:',
                isPassword: false,
                controller: controllername,
                isForm: false,
              ),
              fieldForm(
                label: 'Endereço:',
                isPassword: false,
                controller: controlleraddress,
                isForm: false,
              ),
              fieldForm(
                label: 'Email:',
                isPassword: false,
                controller: controlleremail,
                isForm: false,
              ),
              fieldForm(
                label: 'Senha:',
                isPassword: false,
                controller: controllerPassword,
                isForm: false,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, "/create");
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: const Text('Editar'),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    userProvider.indexUser = null;
                    userProvider.users.removeAt(index!);

                    Navigator.popAndPushNamed(context, "/list");
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 247, 100, 90)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: const Text('Excluir'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
