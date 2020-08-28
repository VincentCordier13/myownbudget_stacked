import 'package:flutter/cupertino.dart';

class DateClass {
  int day;
  int month;
  int year;

  DateClass({@required this.day, @required this.month, @required this.year});

  DateClass.dateTime(DateTime dateTime) {
    this.day = dateTime.day;
    this.month = dateTime.month;
    this.year = dateTime.year;
  }

  DateClass.today() {
    DateTime today = DateTime.now();
    this.day = today.day;
    this.month = today.month;
    this.year = today.year;
  }

  DateClass.fromData({@required String data}) {
    List<String> datas = data.split(".");
    this.day = int.parse(datas[0]);
    this.month = int.parse(datas[1]);
    this.year = int.parse(datas[2]);
  }

  String toData() {
    return this.day.toString() + "." + this.month.toString() + "." + this.year.toString();
  }

  String toString({PeriodEnum period = PeriodEnum.dayly}) {
    String stringDate = "";
    DateClass today = new DateClass.today();

    if (period == PeriodEnum.dayly && this.isEqual(today))
      return "Aujourd'hui";
    if (period == PeriodEnum.monthly && this.isEqual(today, period: PeriodEnum.monthly))
      return "Ce mois-ci";
    if (period == PeriodEnum.yearly && this.isEqual(today, period: PeriodEnum.yearly))
      return "Cette année";

    if (period == PeriodEnum.dayly)
      stringDate += this.day.toString() + " ";
    if (period != PeriodEnum.yearly)
      stringDate += Month.values[this.month - 1].toString().substring(Month.values[this.month - 1].toString().indexOf('.') + 1);
    if (period != PeriodEnum.yearly && (this.year != today.year))
      stringDate += " ";
    if ((this.year != today.year))
      stringDate += this.year.toString();

    return stringDate;
  }

  bool isEqual(DateClass otherDate, {PeriodEnum period = PeriodEnum.dayly}) {
    bool possibleEqual = true;
    if (period == PeriodEnum.dayly) {
      if (this.day != otherDate.day)
        possibleEqual = false;
    }
    if (period != PeriodEnum.yearly) {
      if (this.month != otherDate.month)
        possibleEqual = false;
    }
    if (this.year != otherDate.year)
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

