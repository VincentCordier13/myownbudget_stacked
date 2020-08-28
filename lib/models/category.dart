import 'package:myownbudget_stacked/models/tools/allocation_tool.dart';
import 'package:myownbudget_stacked/models/tools/icon_tool.dart';

class Category {
  int id;
  String name;
  IconClass icon;
  List<AllocationClass> allocations;
  String description;
}