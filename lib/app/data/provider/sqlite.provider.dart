import 'package:app_colabora_unimedjp/app/data/models/authentication_response.model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/contract.model.dart';

class SqliteApi {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  static Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'db_unimedV4.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  static Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE perfil (
        id INTEGER PRIMARY KEY,
        codigo TEXT,
        nome TEXT,
        cpf TEXT,
        categoriaSigla TEXT,
        categoria TEXT,
        pessoaId INTEGER,
        contratoId INTEGER,
        contratoCodigo TEXT
      );
    ''');

    await db.execute('''
      CREATE TABLE contrato (
        id INTEGER PRIMARY KEY,
        codigo TEXT,
        nome TEXT,
        cpf TEXT,
        categoriaSigla TEXT,
        categoria TEXT,
        pessoaId INTEGER,
        contratoId INTEGER,
        contratoCodigo TEXT
      );
    ''');
  }

  static Future<int> insertProfile(AuthResponseModel data) async {
    final db = await database;
    return await db.insert(
      'perfil',
      data.toJsonSqlite(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<AuthResponseModel>> getProfile() async {
    final db = await database;
    final maps = await db.query('perfil');
    return maps.map((map) => AuthResponseModel.fromJson(map)).toList();
  }

  static Future<int> updateProfile(AuthResponseModel data) async {
    final db = await database;
    return await db.update(
      'perfil',
      data.toJson(),
      where: 'id = ?',
      whereArgs: [data.id],
    );
  }

  static Future<int> deleteProfile(int id) async {
    final db = await database;
    return await db.delete('perfil', where: 'id = ?', whereArgs: [id]);
  }

  static Future<int> insertContract(ContractModel data) async {
    final db = await database;
    return await db.insert(
      'contrato',
      data.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<ContractModel>> getContract({int? id}) async {
    final db = await database;
    final maps = id != null
        ? await db.query('contrato', where: 'id = ?', whereArgs: [id])
        : await db.query('contrato');

    return maps.map((map) => ContractModel.fromJson(map)).toList();
  }

  static Future<int> updateContract(ContractModel data) async {
    final db = await database;
    return await db.update(
      'contrato',
      data.toJson(),
      where: 'id = ?',
      whereArgs: [data.id],
    );
  }

  static Future<int> deleteContrato(int id) async {
    final db = await database;
    return await db.delete('contrato', where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> clearDatabase() async {
    final db = await database;
    await db.delete('perfil');
    await db.delete('contrato');
  }
}
