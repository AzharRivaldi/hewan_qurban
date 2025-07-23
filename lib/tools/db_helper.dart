import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/model_database.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('qurban.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE qurban_order (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nama TEXT NOT NULL,
      size TEXT NOT NULL,
      jml_uang TEXT NOT NULL,
      tgl_order TEXT NOT NULL,
      image_url TEXT NOT NULL
    )
    ''');
  }

  Future<ModelDatabase> create(ModelDatabase mdlDatabase) async {
    final db = await instance.database;
    final id = await db.insert('qurban_order', mdlDatabase.toMap());
    return ModelDatabase(id: id,
        nama: mdlDatabase.nama, size: mdlDatabase.size,
        jml_uang: mdlDatabase.jml_uang,
        tgl_order: mdlDatabase.tgl_order);
  }

  Future<List<ModelDatabase>> readAllOrder() async {
    final db = await instance.database;
    final result = await db.query('qurban_order');

    return result.map((json) => ModelDatabase.fromMap(json)).toList();
  }

  Future<int> update(ModelDatabase mdlDatabase) async {
    final db = await instance.database;

    return db.update(
      'qurban_order',
      mdlDatabase.toMap(),
      where: 'id = ?',
      whereArgs: [mdlDatabase.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      'qurban_order',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}