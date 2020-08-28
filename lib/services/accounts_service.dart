import 'package:myownbudget_stacked/app/locator.dart';
import 'package:myownbudget_stacked/models/account.dart';
import 'package:myownbudget_stacked/services/api/sql_api_service.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stacked/stacked.dart';

class AccountsService with ReactiveServiceMixin {
  //final _api = locator<SqlApiService>();

  static Database _database;
  Future<Database> get database async {
    print("getter account database");
    if (_database == null) {
      _database = await /*_api.*/initDatabase(AccountDataModel.filename, AccountDataModel.table, AccountDataModel.sqlCreateTable());
    }
    return _database;
  }

  RxValue<List<Account>> _accounts = RxValue<List<Account>>();
  AccountsService() {listenToReactiveValues([_accounts]);}

  List<Account> get accounts => _accounts.value;
  bool get hasAccounts => _accounts.value != null && _accounts.value.isNotEmpty;


  Future<List<Account>> loadAccounts() async {
    print("loadAccounts");
    _accounts.value = new List<Account>();
    final datas = await /*_api.*/load(/*database, */AccountDataModel.table, AccountDataModel.columns());
    print(datas);
    datas.forEach((data) { 
      print(data);
      print(_accounts.value.length);
      _accounts.value.add(new Account.fromData(data));
      print(_accounts.value.last);
    });
    print(_accounts.value);
    return _accounts.value;
  }

  Future<int> insertAccount(Account account) async {
    print("insertAccount");
    final data = account.toData();
    return await /*_api.*/insert(/*database, */AccountDataModel.table, data);
  }

  Future<int> updateAccount(Account account) async {
    print("updateAccount");
    final data = account.toData();
    return await /*_api.*/update(/*database, */AccountDataModel.table, data);
  }

  Future<int> deleteAccount(Account account) async {
    return await /*_api.*/delete(/*database, */AccountDataModel.table, account.id);
  }


  /// test
  Future<Database> initDatabase(String name, String table, String sqlCreateRows) async {
    print("api : initDatabase");
    final db = await openDatabase(
      join(await getDatabasesPath(), name),
      onCreate: (db, version) async {
        print("api : create database");
        await db.execute(sqlCreateRows);
      },
      version: 1,
    );
    print(Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table')));
    return db;
  }

  Future<List<Map<String, dynamic>>> load(String table, List<String> columns) async {
    print("api : load");
    final Database db = await database;
    var response = await db.query(table, columns: columns);
    print(response);
    return response;
  }

  Future<int> insert(String table, Map<String, dynamic> data) async {
    print("api : insert");
    final Database db = await database;
    return await db.insert(table, data);
  }

  Future<int> update(String table, Map<String, dynamic> data) async {
    print("api : update");
    final Database db = await database;
    return await db.update(
      table, 
      data,
      where: "id = ?",
      whereArgs: [data["ID"]],
    );
  }

  Future<int> delete(String table, int id) async {
    print("api : delete");
    final Database db = await database;
    return await db.delete(
      table,
      where: "id = ?",
      whereArgs: [id],
    );
  }

}