import 'package:flutter/material.dart';
import 'package:biblioteca_uniceu_alvarenga/login_page.dart';
import 'package:biblioteca_uniceu_alvarenga/reserva_page.dart';

import 'home_page.dart';
import 'catalogo_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/catalogo': (context) => const catalogoPage(),
        '/reserva': (context) => const reservaPage()
      },
    );
  }
}

class CatalogoPage {
  const CatalogoPage();
}
