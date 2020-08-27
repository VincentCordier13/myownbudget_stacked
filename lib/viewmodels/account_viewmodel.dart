import 'package:myownbudget_stacked/models/account.dart';
import 'package:stacked/stacked.dart';

class AccountsViewModel extends FutureViewModel<List<Account>> {
  Future<List<Account>> getDatas() async {
    
  }

  @override
  Future<List<Account>> futureToRun() => getDatas();
}