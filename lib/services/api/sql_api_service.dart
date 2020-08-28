import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlApiService {

  Future<Database> initDatabase(String name, String table, String sqlCreateRows) async {
    print("Data : initDatabase account");
    return await openDatabase(
      join(await getDatabasesPath(), name),
      onCreate: (db, version) async {
        print("Data : create account database");
        await db.execute(sqlCreateRows);
      },
      version: 1,
    );
  }

  Future<List<Map<String, dynamic>>> load(Future<Database> database, String table, List<String> columns) async {
    print("Data : load account");
    final Database db = await database;
    return await db.query(table, columns: columns);
  }

  Future<int> insert(Future<Database> database, String table, Map<String, dynamic> data) async {
    print("Data : insert account");
    final Database db = await database;
    return await db.insert(table, data);
  }

  Future<int> update(Future<Database> database, String table, Map<String, dynamic> data) async {
    print("Data : update account");
    final Database db = await database;
    return await db.update(
      table, 
      data,
      where: "id = ?",
      whereArgs: [data["ID"]],
    );
  }

  Future<int> delete(Future<Database> database, String table, int id) async {
    print("Data : delete account");
    final Database db = await database;
    return await db.delete(
      table,
      where: "id = ?",
      whereArgs: [id],
    );
  }
  
}