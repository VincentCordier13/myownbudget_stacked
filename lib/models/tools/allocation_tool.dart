import 'package:flutter/cupertino.dart';

class AllocationClass{
  int idBudget;
  String budgetName;
  double value;
  AllocationEnum allocationType;

  AllocationClass({@required this.idBudget, @required this.budgetName, @required this.value, @required this.allocationType});

  AllocationClass.fromData({@required String data}) {
    List<String> datas = data.split(".");
    this.idBudget = int.parse(datas[0]);
    this.value = double.parse(datas[1]);
    this.allocationType = this.allocationType.fromStringData(datas[2]);
  }

  String toData() {
    return this.idBudget.toString() + "." + this.value.toString() + "." + this.allocationType.toStringData();
  }

  String toString() {
    return this.value.toString() + this.allocationType.toStringValue() + " " + this.budgetName;
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

  String toStringData() {
    return this.toString().substring(this.toString().indexOf('.') + 1);
  }

  AllocationEnum fromStringData(String string) {
    return AllocationEnum.values.firstWhere((e) => e.toString() == string);
  }
}