import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AllocationClass{
  int _idBudget;
  // String _budgetName;
  double _value;
  AllocationEnum _allocationType;

  AllocationClass() {
    print("MoneyClass");
    _idBudget = 0;
    _value = 0.0;
    _allocationType = null;
  }

  AllocationClass.fromData({@required String data}) {
    print("MoneyClass.fromData");
    List<String> datas = data.split("@");
    _idBudget = int.parse(datas[0]);
    _value = double.parse(datas[1]);
    _allocationType = allocationFromData(data: datas[2]);
  }

  String toData() {
    print("MoneyClass toData");
    return _idBudget.toString() + "@" + _value.toStringAsFixed(2) + "@" + _allocationType.toData();
  }

  String toString() {
    print("MoneyClass toString");
    return _value.toString() + _allocationType.toStringValue() + " ";// + _budgetName;
  }

  String get getBudgetName {
    return "";
  }
  AllocationClass.setBudgetId({@required int budgetId}) {
    print("MoneyClass.setBudgetId");
    _idBudget = budgetId;
    _value = 0.0;
    _allocationType = null;
  }
}

List<String> allocationsToString(List<AllocationClass> allocations) {
  List<String> list = new List<String>();
  allocations.forEach((currentAllocation) {
    list.add(currentAllocation.toString());
  });
  return list;
}

List<AllocationClass> allocationsFromData(String data) {
  List<AllocationClass> allocations = new List<AllocationClass>();
  List<String> datas = data.split("/");
  datas.forEach((currentData) {
    currentData != "" ?? 
      allocations.add(new AllocationClass.fromData(data: currentData));
  });
  return allocations;
}

String allocationsToData(List<AllocationClass> allocations) {
  String string = "";
  allocations.forEach((currentAllocation) {
    string += currentAllocation.toData();
    string += "/";
  });
  return string;
}

enum AllocationEnum {
  pourcent,
  fixed,
}

extension on AllocationEnum {
  
  String toStringValue() {
    switch (this) {
      case AllocationEnum.pourcent :
        return "%";
      case AllocationEnum.fixed :
        return "€";
      default:
        return "";
    }
  }

  String toData() => describeEnum(this);
}

AllocationEnum allocationFromData({@required String data}) => AllocationEnum.values.firstWhere((e) => describeEnum(e) == data);
