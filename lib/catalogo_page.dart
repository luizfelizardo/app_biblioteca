import 'dart:convert';

import 'package:biblioteca_uniceu_alvarenga/container_all.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CatalogoItem {
  final String title;
  final String description;

  CatalogoItem(this.title, this.description);

  toJson() {
    return {
      'title': title,
      'description': description,
    };
  }
}

class Catalogo {}

class catalogoPage extends StatefulWidget {
  const catalogoPage({super.key});

  @override
  State<catalogoPage> createState() => _catalogo_pageState();
}

class _catalogo_pageState extends State<catalogoPage> {
  List<CatalogoItem> items = [
    CatalogoItem("Livro: A Arca de Noé",
        "Autor: Vinícius de Moraes \nEditora: Editora Companhia das Letrinhas \nISBN: "),
    CatalogoItem("Livro: Vidas Secas",
        "Autor: Graciliano Ramos \nEditora: Editora Companhia das Letras \nISBN: "),
    CatalogoItem("Livro: O Cortiço",
        "Autor: Aluísio Azevedo\nEditora: Editora Nova Fronteira\nISBN: 978-85-375-4397-2"),
    CatalogoItem("Livro: Dom Casmurro",
        "Autor: Machado de Assis\nEditora: Editora Nova Fronteira\nISBN: 978-85-375-4398-9"),
    CatalogoItem("Livro: Memórias Póstumas de Brás Cubas",
        "Autor: Machado de Assis\nEditora: Editora Nova Fronteira\nISBN: 978-85-375-4399-6"),
    CatalogoItem("Livro: O Triste Fim de Policarpo Quaresma",
        "Autor: Lima Barreto\nEditora: Editora Nova Fronteira\nISBN: 978-85-375-4400-2"),
    CatalogoItem("Livro: O Ateneu",
        "Autor: Raul Pompeia\nEditora: Editora Nova Fronteira\nISBN: 978-85-375-4401-9"),
    CatalogoItem("Livro: O Quinze",
        "Autor: Machado de Assis\nEditora: Editora Nova Fronteira\nISBN: 978-85-375-4402-6"),
    CatalogoItem("Livro: Contos de Machado de Assis",
        "Autor: Machado de Assis\nEditora: Editora Nova Fronteira\nISBN: 978-85-375-4403-3"),
    CatalogoItem("Livro: Maira",
        "Autor: Jorge Amado\nEditora: Editora Record\nISBN: 978-85-00-10272-4"),
  ];

  @override
  Widget build(BuildContext context) {
    return ContainerAll(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 247, 240, 248),
        appBar: AppBar(
          title: const Text("Tela Catálogo de Livros"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.description),
                );
              },
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                onPressed: () {
                  _adicionarNovoLivro(); // Chamar a função para adicionar novo livro
                },
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _adicionarNovoLivro() {
    // Mostrar o formulário para novo livro
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Adicionar Livro Novo'),
          content: SingleChildScrollView(
            child: Column(
              children:
                  List.generate(2, (index) => _buildTextField(index)).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                // Salvar o novo livro
                Navigator.of(context).pop();
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }
}

class _buildTextField extends StatelessWidget {
  final int index;

  const _buildTextField(this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: index == 0 ? 'Título' : 'Autor',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

Future<void> _saveItems() async {
  final prefs = await SharedPreferences.getInstance();
  var items = <CatalogoItem>[];
  final jsonString = jsonEncode(items.map((item) => item.toJson()).toList());
  await prefs.setString('items', jsonString);
}
