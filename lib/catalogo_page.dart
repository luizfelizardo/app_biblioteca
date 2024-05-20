import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class CatalogoItem {
  final String title;
  final String description;
  final String id;

  CatalogoItem({
    required this.title,
    required this.description,
    required this.id,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
      };

  static CatalogoItem fromJson(Map<String, dynamic> json, String id) =>
      CatalogoItem(
        title: json['title'],
        description: json['description'],
        id: id,
      );
}

class catalogoPage extends StatefulWidget {
  const catalogoPage({super.key});

  @override
  _CatalogoPageState createState() => _CatalogoPageState();
}

class _CatalogoPageState extends State<catalogoPage> {
  List<CatalogoItem> items = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeFirebaseAndLoadItems();
  }

  Future<void> _initializeFirebaseAndLoadItems() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await _loadItems();
    } catch (e) {
      print('Erro ao inicializar o Firebase e carregar itens: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _loadItems() async {
    try {
      final firestore = FirebaseFirestore.instance;
      final catalogo = firestore.collection('catalogo');
      final querySnapshot = await catalogo.get();

      setState(() {
        items = querySnapshot.docs
            .map((doc) => CatalogoItem.fromJson(
                doc.data() as Map<String, dynamic>, doc.id))
            .toList();
      });
    } catch (e) {
      print('Erro ao carregar itens: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao carregar livros: $e')),
      );
    }
  }

  Future<void> _saveItem(CatalogoItem item) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final catalogo = firestore.collection('catalogo');
      await catalogo.add(item.toJson());
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao salvar o livro: $e')),
      );
    }
  }

  void _adicionarNovoLivro() {
    showDialog(
      context: context,
      builder: (context) {
        String newTitle = '';
        String newDescription = '';

        return AlertDialog(
          title: const Text('Adicionar Livro Novo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Título'),
                onChanged: (value) => newTitle = value,
              ),
              TextField(
                decoration: const InputDecoration(
                    labelText: 'Descrição (Autor, Editora, ISBN)'),
                onChanged: (value) => newDescription = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                if (newTitle.isNotEmpty && newDescription.isNotEmpty) {
                  final newItem = CatalogoItem(
                      title: newTitle, description: newDescription, id: '');
                  await _saveItem(newItem);
                  await _loadItems(); // Recarrega os itens após salvar
                  setState(() {});
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Preencha todos os campos!')),
                  );
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela Catálogo de Livros"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.description),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _adicionarNovoLivro, // Chama a função para adicionar livro
        child: const Icon(Icons.add),
      ),
    );
  }
}
