enum OperationEnum {
  income,
  expense,
}

extension OperationEnumExtension on OperationEnum {

  String toStringValue() {
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