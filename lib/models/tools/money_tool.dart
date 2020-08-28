import 'package:flutter/cupertino.dart';

class MoneyClass {
  double amount;
  CurrencyEnum currency;

  MoneyClass({@required this.amount, @required this.currency});

  MoneyClass.setNull() {
    currency = CurrencyEnum.values[0];
  }

  MoneyClass.fromData({@required String data}) {
    List<String> datas = data.split(".");
    this.amount = double.parse(datas[0]);
    this.currency = this.currency.fromStringData(datas[1]);
  }

  String toData() {
    return this.amount.toString() + "." + this.currency.toStringData();
  }

  String toString() {
    return this.currency.toStringValue() + " " + this.amount.toStringAsFixed(2);
  }
}

List<String> getMoniesToString(List<MoneyClass> monies) {
  List<String> list = new List<String>();
  monies.forEach((currentMoney) {
    currentMoney.toString();
  });
  return list;
}

List<MoneyClass> moniesFromData(String data) {
  List<MoneyClass> monies = new List<MoneyClass>();
  List<String> datas = data.split("/");
  datas.forEach((currentData) {
    currentData != "" ?? 
      monies.add(new MoneyClass.fromData(data: currentData));
  });
  return monies;
}

String moniesToData(List<MoneyClass> monies) {
  String string = "";
  monies != null ??
    monies.forEach((currentMoney) {
      string += currentMoney.toData();
      string += "/";
    });
  return string;
}

enum CurrencyEnum {
  euros,
  dollars,
  cad,
  pounds,
}

extension on CurrencyEnum {

  String toStringValue() {
    switch (this) {
      case CurrencyEnum.euros :
        return "€";
      case CurrencyEnum.dollars :
        return "\$";
      case CurrencyEnum.cad :
        return "CAD\$";
      case CurrencyEnum.pounds :
        return "£";
      default:
        return "";
    }
  }

  String toStringData() {
    return this.toString().substring(this.toString().indexOf('.') + 1);
  }

  CurrencyEnum fromStringData(String string) {
    return CurrencyEnum.values.firstWhere((e) => e.toString() == string);
  }
}