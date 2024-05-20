import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';

class ContaRepository extends ChangeNotifier {
  late Database db;

  ContaRepository() {
    _initRepository();
  }

  _initRepository() async {
    db = await openDatabase('biblioteca_uniceu_alvarenga.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE conta(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          email TEXT NOT NULL,
          senha REAL
        );
      ''');
      await db.execute('''
        CREATE TABLE livro(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nome TEXT,
          autor TEXT,
          
          
        );
      ''');
      await db.execute('''
        CREATE TABLE nome(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nome TEXT NOT NULL,
          endereco TEXT NOT NULL,
          email TEXT NOT NULL,
          senha TEXT NOT NULL
        );
      ''');
    });
  }
}
// Path: lib/database/conta_repository.dart