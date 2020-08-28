import 'package:myownbudget_stacked/models/budget.dart';
import 'package:stacked/stacked.dart';

class BudgetsViewModel extends FutureViewModel<List<Budget>> {
  Future<List<Budget>> getDatas() async {
    print("getDatas operation");
  }

  @override
  Future<List<Budget>> futureToRun() => getDatas();
}