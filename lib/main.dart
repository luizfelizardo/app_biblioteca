import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

class CatalogoItem {
  final String title;
  final String description;

  CatalogoItem(this.title, this.description);
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  Widget? _switcherBody() {
    switch (_index) {
      case 0:
        return Container(child: const Center(child: Text("CATALOGO")));
      case 1:
        return Container(child: const Center(child: Text("RESERVA")));
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("BIBLIOTECA COMUNITÁRIA \nUNICEU ALVARENGA")),
      body: _switcherBody(),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 177, 202, 226),
            ),
            child: Text('BIBLIOTECA COMUNITÁRIA \nUNICEU ALVARENGA'),
          ),
          ListTile(
            title: const Text('CATALOGO'),
            onTap: () {
              setState(() {
                _index = 0;
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('RESERVA'),
            onTap: () {
              setState(() {
                _index = 1;
              });
              Navigator.pop(context);
            },
          ),
        ]),
      ),
    );
  }
}
