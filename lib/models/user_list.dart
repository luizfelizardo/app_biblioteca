import 'package:flutter/material.dart';
import 'package:biblioteca_uniceu_alvarenga/models/user.dart';
import 'package:biblioteca_uniceu_alvarenga/models/user_provider.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = UserProvider.of(context) as UserProvider;

    List<User> users = userProvider.users;

    int usersLength = users.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela Usuários'),
        leading: BackButton(
          onPressed: () {
            userProvider.indexUser = null;
            Navigator.popAndPushNamed(context, "/create");
          },
        ),
      ),
      body: ListView.builder(
          itemCount: usersLength,
          itemBuilder: (BuildContext contextBuilder, indexBuilder) => Container(
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(width: 0.4))),
                child: ListTile(
                  title: Text(users[indexBuilder].name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            userProvider.userSelected = users[indexBuilder];
                            userProvider.indexUser = indexBuilder;
                            Navigator.popAndPushNamed(context, "/create");
                          },
                          icon: const Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            userProvider.userSelected = users[indexBuilder];
                            userProvider.indexUser = indexBuilder;
                            Navigator.popAndPushNamed(context, "/view");
                          },
                          icon: const Icon(
                            Icons.visibility,
                            color: Color.fromARGB(255, 212, 172, 216),
                          )),
                      IconButton(
                          onPressed: () {
                            userProvider.indexUser = null;
                            userProvider.users.removeAt(indexBuilder);
                            Navigator.popAndPushNamed(context, "/List");
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Color.fromARGB(255, 243, 91, 91),
                          )),
                    ],
                  ),
                ),
              )),
    );
  }
}
