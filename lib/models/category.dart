import 'package:myownbudget_stacked/models/tools/allocation_tool.dart';
import 'package:myownbudget_stacked/models/tools/icon_tool.dart';

class Category {
  int _id;
  int get id => _id;
  String name;
  IconClass icon;
  List<AllocationClass> allocations;
  String description;
}