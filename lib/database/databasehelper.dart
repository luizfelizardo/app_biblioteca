import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// ignore: camel_case_types
class databaseHelper {
  static const _databaseName = "meu_banco.db";
  static const _databaseVersion = 1;

  static const table = 'minha_tabela';

  static const columnId = '_id';
  static const columnname = 'nome';
  static const columnemail = 'email';
  static const columnpassword = 'senha';
  // make this a singleton class
  databaseHelper._privateConstructor();
  static final databaseHelper instance = databaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnname TEXT NOT NULL,
            $columnemail INTEGER NOT NULL,
            $columnpassword INTEGER NOT NULL,
          )
          ''');
  }

  insert(Map<String, dynamic> row) {}

  queryAllRows() {}
}
// Path: lib/models/databasehelper.dart