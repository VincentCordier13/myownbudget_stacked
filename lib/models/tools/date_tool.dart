import 'package:flutter/cupertino.dart';

class DateClass {
  int _day;
  int _month;
  int _year;

  DateClass() {
    _day = 0;
    _month = 0;
    _year = 0;
  }

  DateClass.dateTime(DateTime dateTime) {
    print("DateClass.dateTime");
    _day = dateTime.day;
    _month = dateTime.month;
    _year = dateTime.year;
  }

  DateClass.today() {
    print("DateClass.today");
    DateTime today = DateTime.now();
    _day = today.day;
    _month = today.month;
    _year = today.year;
  }

  DateClass.fromData({@required String data}) {
    print("DateClass.fromData");
    List<String> datas = data.split("@");
    _day = int.parse(datas[0]);
    _month = int.parse(datas[1]);
    _year = int.parse(datas[2]);
  }

  String toData() {
    print("DateClass toData");
    return _day.toString() + "@" + _month.toString() + "@" + _year.toString();
  }

  String toString({PeriodEnum period = PeriodEnum.dayly}) {
    print("DateClass toString");
    String stringDate = "";
    DateClass today = new DateClass.today();

    if (period == PeriodEnum.dayly && this.isEqual(today))
      return "Aujourd'hui";
    if (period == PeriodEnum.monthly && this.isEqual(today, period: PeriodEnum.monthly))
      return "Ce mois-ci";
    if (period == PeriodEnum.yearly && this.isEqual(today, period: PeriodEnum.yearly))
      return "Cette année";

    if (period == PeriodEnum.dayly)
      stringDate += _day.toString() + " ";
    if (period != PeriodEnum.yearly)
      stringDate += Month.values[_month - 1].toString().substring(Month.values[_month - 1].toString().indexOf('.') + 1);
    if (period != PeriodEnum.yearly && (_year != today._year))
      stringDate += " ";
    if ((_year != today._year))
      stringDate += _year.toString();

    return stringDate;
  }

  bool isEqual(DateClass otherDate, {PeriodEnum period = PeriodEnum.dayly}) {
    print("DateClass toString");
    bool possibleEqual = true;
    if (period == PeriodEnum.dayly) {
      if (_day != otherDate._day)
        possibleEqual = false;
    }
    if (period != PeriodEnum.yearly) {
      if (_month != otherDate._month)
        possibleEqual = false;
    }
    if (_year != otherDate._year)
      possibleEqual = false;  

    return possibleEqual;
  }
}

enum Month {
  janvier, 
  fevrier,
  mars,
  avril,
  mai,
  juin,
  juillet,
  aout,
  septembre,
  octobre,
  novembre,
  decembre,
}

enum PeriodEnum {
  dayly,
  monthly,
  yearly,
}

