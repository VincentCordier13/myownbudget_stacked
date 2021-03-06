import 'package:myownbudget_stacked/models/tools/date_tool.dart';
import 'package:myownbudget_stacked/models/tools/icon_tool.dart';
import 'package:myownbudget_stacked/models/tools/money_tool.dart';

class Budget {
  int _id;
  int get id => _id;
  String name;
  IconClass icon;
  List<MoneyClass> monies;
  DateClass dateofLastOperation;
  String details;
}