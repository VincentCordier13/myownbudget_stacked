import 'package:myownbudget_stacked/models/account.dart';
import 'package:myownbudget_stacked/models/category.dart';
import 'package:myownbudget_stacked/models/tools/date_tool.dart';
import 'package:myownbudget_stacked/models/tools/operation_tool.dart';

class Operation {
  int id;
  OperationEnum operationType;
  Category category;
  double amount;
  Account account;
  DateClass date;
  String description;
}