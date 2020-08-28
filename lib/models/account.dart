import 'package:myownbudget_stacked/models/tools/date_tool.dart';
import 'package:myownbudget_stacked/models/tools/icon_tool.dart';
import 'package:myownbudget_stacked/models/tools/money_tool.dart';

class Account {
  int id;
  String name;
  IconClass icon;
  MoneyClass money;
  DateClass dateofLastOperation;
  String description;

  Account() {
    this.id = null;
    this.name = "";
    this.icon = new IconClass();
    this.money = new MoneyClass();
    this.dateofLastOperation = new DateClass.today();
    this.description = "";
  }

  Account.fromData(Map<String, dynamic> data) {
    print("Account.fromData");
    this.id = data[AccountDataModel._ID];
    this.name = data[AccountDataModel._NAME];
    this.icon = new IconClass.fromData(data: data[AccountDataModel._ICON]);
    this.money = new MoneyClass.fromData(data: data[AccountDataModel._MONEY]);
    this.dateofLastOperation = new DateClass.fromData(data: data[AccountDataModel._DATE]);
    this.description = data[AccountDataModel._DESCRIPTION];
  }

  Map<String, dynamic> toData() {
    return <String, dynamic> {
      //AccountDataModel._ID: this.id, //auto-increment
      AccountDataModel._NAME: this.name,
      AccountDataModel._ICON: this.icon.toData(),
      AccountDataModel._MONEY: this.money.toData(),
      AccountDataModel._DATE: this.dateofLastOperation.toData(),
      AccountDataModel._DESCRIPTION: this.description,
    };
  }
}

class AccountDataModel {
  static const String _FILENAME = "accounts.db";
  static const String _TABLE = "ACCOUNTS";
  static const String _ID = "ID";
  static const String _NAME = "NAME";
  static const String _ICON = "ICON";
  static const String _MONEY = "MONEY";
  static const String _DATE = "DATE";
  static const String _DESCRIPTION = "DESCRIPTION"; 

  static String get filename => _FILENAME;
  static String get table => _TABLE;

  static String sqlCreateTable() {
    return 
      "CREATE TABLE $_TABLE ("
      "$_ID INTEGER PRIMARY KEY,"
      "$_NAME TEXT,"
      "$_ICON TEXT," 
      "$_MONEY TEXT,"
      "$_DATE TEXT,"
      "$_DESCRIPTION TEXT)";
  }

  static List<String> columns() {
    return [_ID, _NAME, _ICON, _MONEY, _DATE, _DESCRIPTION];
  }
}

