import 'package:myownbudget_stacked/models/operation.dart';
import 'package:stacked/stacked.dart';

class OperationsViewModel extends FutureViewModel<List<Operation>> {
  Future<List<Operation>> getDatas() async {
    
  }

  @override
  Future<List<Operation>> futureToRun() => getDatas();
}