import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlApiService {

  Future<Database> initDatabase(String name, String table, String sqlCreateRows) async {
    print("api : initDatabase");

    //removeDatabase(name);
    
    // return await openDatabase(
    //   join(await getDatabasesPath(), name),
    //   onCreate: (db, version) async {
    //     print("api : create database");
    //     await db.execute(sqlCreateRows);
    //   },
    //   version: 1,
    // );

    Database response = await openDatabase(
      join(await getDatabasesPath(), name),
      onCreate: (db, version) async {
        print("api : create database");
        await db.execute(sqlCreateRows);
      },
      version: 1,
    );
    print("Account database length : ${Sqflite.firstIntValue(await response.rawQuery('SELECT COUNT(*) FROM $table'))}");
    return response;
  }

  Future<void> removeDatabase(String name) async {
    print("api : deleteDatabase");
    await deleteDatabase(join(await getDatabasesPath(), name));
  }

  Future<List<Map<String, dynamic>>> load(Future<Database> database, String table, List<String> columns) async {
    print("api : load");
    final Database db = await database;
    //return await db.query(table, columns: columns);
    List<Map<String, dynamic>> response = await db.query(table, columns: columns);
    print("Account database length : ${Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'))}");
    return response;
  }

  Future<int> insert(Future<Database> database, String table, Map<String, dynamic> data) async {
    print("api : insert");
    final Database db = await database;
    //return await db.insert(table, data);
    int response = await db.insert(table, data);
    print("Account database length : ${Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'))}");
    return response;
  }

  Future<int> update(Future<Database> database, String table, Map<String, dynamic> data) async {
    print("api : update");
    final Database db = await database;
    // return await db.update(
    //   table, 
    //   data,
    //   where: "id = ?",
    //   whereArgs: [data["ID"]],
    // );
    int response = await db.update(
      table, 
      data,
      where: "id = ?",
      whereArgs: [data["ID"]],
    );
    print("Account database length : ${Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'))}");
    return response;
  }

  Future<int> delete(Future<Database> database, String table, int id) async {
    print("api : delete");
    final Database db = await database;
    // return await db.delete(
    //   table,
    //   where: "id = ?",
    //   whereArgs: [id],
    // );
    int response = await db.delete(
      table,
      where: "id = ?",
      whereArgs: [id],
    );
    print("Account database length : ${Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'))}");
    return response;
  }
  
}