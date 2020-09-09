import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class MoneyClass {
  double _amount;
  CurrencyEnum _currency;

  MoneyClass() {
    print("MoneyClass");
    _amount = 0.0;
    _currency = null;
  }

  MoneyClass.fromData({@required String data}) {
    print("MoneyClass.fromData");
    List<String> datas = data.split("@");
    _amount = double.parse(datas[0]);
    _currency = currencyFromData(data: datas[1]);
  }

  String toData() {
    print("MoneyClass toData");
    return _amount.toStringAsFixed(2) + "@" + _currency.toData();
  }

  String toString() {
    print("MoneyClass toString");
    return _currency.toStringValue + " " + _amount.toStringAsFixed(2);
  }

  double get getAmount => _amount;
  set setAmount(double amount) => _amount = amount;

  String get getCurrency => _currency.toStringValue;
  MoneyClass.setCurrency({@required CurrencyEnum currency}) {
    print("MoneyClass.setCurrency");
    _amount = 0.0;
    _currency = currency;
  } 
}

List<String> moniesToString(List<MoneyClass> monies) {
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

extension CurrencyEnumExtension on CurrencyEnum {

  String get toStringValue {
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

  String toData() => describeEnum(this);
}

CurrencyEnum currencyFromData({@required String data}) => CurrencyEnum.values.firstWhere((e) => describeEnum(e) == data);
