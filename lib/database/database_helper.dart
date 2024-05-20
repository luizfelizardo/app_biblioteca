import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class databaseHelper {
  databaseHelper._();

  static final databaseHelper instance = databaseHelper._();
  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'biblioteca_uniceu_alvarenga.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, versao) async {
    await db.execute(_conta);
    await db.execute(_livro);
    await db.execute(_nome);

    await db.insert('conta', {'nome': 0});
  }

  final String _conta = '''
    CREATE TABLE conta(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      email TEXT NOT NULL
      senha REAL
    );
  ''';
  final String _livro = '''
    CREATE TABLE livro(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT,
      autor TEXT,
      
      
    );
  ''';

  final String _nome = '''
    CREATE TABLE nome(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT NOT NULL,
      endereco TEXT NOT NULL,
      email TEXT NOT NULL,
      senha TEXT NOT NULL
    );
  ''';
}
