import 'package:myownbudget_stacked/app/locator.dart';
import 'package:myownbudget_stacked/models/account.dart';
import 'package:myownbudget_stacked/services/api/sql_api_service.dart';
import 'package:sqflite/sqflite.dart';

class AccountsService {
  final _api = locator<SqlApiService>();

  static Database _database;
  Future<Database> get database async {
    print("Data : getter account database");
    if (_database == null) {
      _database = await _api.initDatabase(AccountDataModel.filename, AccountDataModel.table, AccountDataModel.sqlCreateTable());
    }
    return _database;
  }

  List<Account> _accounts;
  List<Account> get accounts => _accounts;
  bool get hasAccounts => _accounts != null && _accounts.isNotEmpty;


  Future<List<Account>> loadAccounts() async {
    _accounts = new List<Account>();
    final datas = await _api.load(database, AccountDataModel.table, AccountDataModel.columns());
    datas.forEach((data) { 
      _accounts.add(new Account.fromData(data));
    });
    return _accounts;
  }

  Future<int> insertAccount(Account account) async {
    final data = account.toData();
    return await _api.insert(database, AccountDataModel.table, data);
  }

  Future<int> updateAccount(Account account) async {
    final data = account.toData();
    return await _api.update(database, AccountDataModel.table, data);
  }

  Future<int> deleteAccount(Account account) async {
    return await _api.delete(database, AccountDataModel.table, account.id);
  }

}