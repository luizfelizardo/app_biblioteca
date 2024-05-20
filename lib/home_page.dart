//import 'package:biblioteca_uniceu_alvarenga/container_all.dart';
import 'package:flutter/material.dart';
import 'package:biblioteca_uniceu_alvarenga/catalogo_page.dart';
import 'package:biblioteca_uniceu_alvarenga/reserva_page.dart';

import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

mostrarReserva(catalogoPage) {}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  final list = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset('assets/imgs/avatar_usuario.png'),
              ),
              accountName: const Text('Olá!'),
              accountEmail: const Text('pi3@gmail.com'),
            ),

            // ignore: prefer_const_constructors
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Visite nosso site \nCEU Alvarenga'),
              onTap: () async {
                const url =
                    'https://ceu.sme.prefeitura.sp.gov.br/unidade/ceu-alvarenga/'; // URL do Gmail
                try {
                  await launchUrl(Uri.parse(url));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Erro ao abrir o e-mail:')),
                  );
                }
              },
            ),

            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('Telefone'),
              subtitle: Text('(11) 5672-2500 / (11) 5672-2544'),
            ),
            const ListTile(
              leading: Icon(Icons.info),
              title: Text('Informações'),
              subtitle: Text(
                  'Estrada do Alvarenga, 3752  \nBalneário São Francisco - \nPedreira - CEP: 04474340'),
            ),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sair'),
              subtitle: const Text('Finalizar sessão'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Tela Inicial"),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      //backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/imgs/livros.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.10),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FlutterLogo(
                      size: 0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const catalogoPage()),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text('Catálogo de livros',
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const reservaPage()),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text('Cadastro de Usuários',
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Atenção"),
                                content: const Text("Deseja realmente sair?"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Cancelar")),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);

                                        Navigator.pop(context);
                                      },
                                      child: const Text("Confirmar")),
                                ],
                              );
                            }); // showDialog
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text('Sair do app',
                            style: TextStyle(
                              fontSize: 20,
                            )),
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
