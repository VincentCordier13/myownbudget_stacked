import 'package:myownbudget_stacked/app/locator.dart';
import 'package:myownbudget_stacked/models/account.dart';
import 'package:myownbudget_stacked/services/accounts_service.dart';
import 'package:stacked/stacked.dart';

class AccountsViewModel extends FutureViewModel<List<Account>> {
  final _service = locator<AccountsService>();
  List<Account> get accounts => _service.accounts;

  @override
  Future<List<Account>> futureToRun() => _service.loadAccounts();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_service];
}