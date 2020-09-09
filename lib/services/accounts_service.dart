import 'package:myownbudget_stacked/app/locator.dart';
import 'package:myownbudget_stacked/models/account.dart';
import 'package:myownbudget_stacked/services/api/sql_api_service.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stacked/stacked.dart';

class AccountsService with ReactiveServiceMixin {
  final _api = locator<SqlApiService>();

  RxValue<List<Account>> _accounts = RxValue<List<Account>>(initial: List<Account>());
  AccountsService() { listenToReactiveValues([_accounts]); }

  List<Account> get accounts => _accounts.value;
  bool get hasAccounts => _accounts.value != null && _accounts.value.isNotEmpty;


  static Database _database;
  Future<Database> get database async {
    print("getter account database");
    if (_database == null) {
      _database = await _api.initDatabase(AccountDataModel.filename, AccountDataModel.table, AccountDataModel.sqlCreateTable());
    }
    return _database;
  }
 
  Future<void> removeAccountDatabase() async {
    print("removeDatabase");
    await _api.removeDatabase(AccountDataModel.filename);
    _database = null;
    await loadAccounts();
  }

  Future<List<Account>> loadAccounts() async {
    print("loadAccounts");
    _accounts.value = new List<Account>();
    final datas = await _api.load(database, AccountDataModel.table, AccountDataModel.columns());
    // print(datas);
    datas.forEach((data) { 
      // print(data);
      // print(_accounts.value.length);
      _accounts.value.add(new Account.fromData(data));
      // print(_accounts.value.last);
    });
    // print(_accounts.value);
    return _accounts.value;
  }

  Future<int> insertAccount(Account account) async {
    print("insertAccount");
    final data = account.toData();
    var response = await _api.insert(database, AccountDataModel.table, data);
    await loadAccounts();
    return response;
  }

  Future<int> updateAccount(Account account) async {
    print("updateAccount");
    final data = account.toData();
    var response = await _api.update(database, AccountDataModel.table, data);
    await loadAccounts();
    return response;
  }

  Future<int> deleteAccount(Account account) async {
    var response = await _api.delete(database, AccountDataModel.table, account.id);
    await loadAccounts();
    return response;
  }

}