import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String senha = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              //child: Image.asset(
              //'assets/imgs/biblioteca.jpg',
              //fit: BoxFit.cover,
            ),
            //),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: const Padding(
                padding: EdgeInsets.all(160.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FlutterLogo(
                        size: 0,
                      ),
                    ]),
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.60),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "BIBLIOTECA COMUNITÁRIA UNICEU ALVARENGA",
                        style: TextStyle(
                          fontSize: 35,
                          color: Color.fromARGB(255, 241, 239, 239),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              TextField(
                                onChanged: (text) {
                                  email = text;
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  labelText: 'E-mail',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                onChanged: (text) {
                                  senha = text;
                                },
                                obscureText: true,
                                decoration: const InputDecoration(
                                  labelText: 'Senha',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  if (email == "pi3@gmail.com" &&
                                      senha == '1234') {
                                    Navigator.of(context).pushNamed('/home');
                                  } else {
                                    print("Login inválido");
                                  }
                                },
                                child: const SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    'Entrar',
                                    style: TextStyle(
                                      fontSize: 21,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('App Biblioteca'),
        actions: [
          Container(
            child: TextButton(
              onPressed: (() {
                Navigator.popAndPushNamed(context, '/');
              }),
              child: const Text('Cadastre-se'),
            ),
          )
        ],
      ),
    );
  }
}
