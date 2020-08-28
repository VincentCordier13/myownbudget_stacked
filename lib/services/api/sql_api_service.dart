import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlApiService {

  Future<Database> initDatabase(String name, String table, String sqlCreateRows) async {
    print("api : initDatabase");
    return await openDatabase(
      join(await getDatabasesPath(), name),
      onCreate: (db, version) async {
        print("api : create database");
        await db.execute(sqlCreateRows);
      },
      version: 1,
    );
  }

  Future<List<Map<String, dynamic>>> load(Future<Database> database, String table, List<String> columns) async {
    print("api : load");
    final Database db = await database;
    print(Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM table_name')));
    if (Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM table_name')) == 0)
      return null;
    return await db.query(table, columns: columns);
  }

  Future<int> insert(Future<Database> database, String table, Map<String, dynamic> data) async {
    print("api : insert");
    final Database db = await database;
    return await db.insert(table, data);
  }

  Future<int> update(Future<Database> database, String table, Map<String, dynamic> data) async {
    print("api : update");
    final Database db = await database;
    return await db.update(
      table, 
      data,
      where: "id = ?",
      whereArgs: [data["ID"]],
    );
  }

  Future<int> delete(Future<Database> database, String table, int id) async {
    print("api : delete");
    final Database db = await database;
    return await db.delete(
      table,
      where: "id = ?",
      whereArgs: [id],
    );
  }
  
}