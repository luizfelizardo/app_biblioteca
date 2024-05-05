import 'package:flutter/material.dart';

void main() {
  runApp(SuperApp());
}

class SuperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BIBLIOTECA COMUNITÁRIA UNICEU ALVARENGA',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('BIBLIOTECA COMUNITÁRIA UNICEU ALVARENGA'),
          ),
          backgroundColor: Color(0xffc6d7c6),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Tela 1',
                  style: TextStyle(fontSize: 40),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff82ba86),
                    shadowColor: Color(0xffdb3208),
                    elevation: 3,
                  ),
                  onPressed: () {
                    print('Botão pressionado');
                  },
                  child: const Text('Botão'),
                ),
              ],
            ),
          )),
    );
  }
}
