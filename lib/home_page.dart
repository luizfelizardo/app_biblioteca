import 'package:biblioteca_uniceu_alvarenga/container_all.dart';
import 'package:flutter/material.dart';
import 'package:biblioteca_uniceu_alvarenga/catalogo_page.dart';
import 'package:biblioteca_uniceu_alvarenga/reserva_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

mostrarReserva(catalogoPage) {}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  final list = <String>[];
  //final int _index = 0;

  //Widget? _switcherBody() {
  //switch (_index) {
  //case 0:
  //return const Center(child: Text("PÁGINA PRINCIPAL"));
  //case 1:
  // return const Center(child: Text("CATÁLOGO DE LIVROS"));
  //case 2:
  // return const Center(child: Text("RESERVE SEU LIVRO AQUI !"));
  // }
  //return null;
  //}

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
              leading: const Icon(Icons.contact_mail),
              title: const Text('Contatos'),
              subtitle: const Text('Tel: \nEmail: \nSite:'),
            ),
            const ListTile(
              leading: Icon(Icons.info),
              title: Text('Informações'),
              subtitle: Text('Endereço: \nHorário de funcionamento:'),
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
      body: ContainerAll(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                // child: Image.asset(
                //  'assets/imgs/livros.png',
                //  fit: BoxFit.cover,
              ),
              //  ),
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
                        size: 200,
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
                          Navigator.pop(context);
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
      ),
    );
  }
}
