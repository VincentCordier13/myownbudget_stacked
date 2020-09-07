enum OperationEnum {
  income,
  expense,
}

extension OperationEnumExtension on OperationEnum {

  String get toStringValue {
    switch (this) {
      case OperationEnum.income :
        return "Revenu";
      case OperationEnum.expense :
        return "Dépense";
      default:
        return "";
    }
  }
}