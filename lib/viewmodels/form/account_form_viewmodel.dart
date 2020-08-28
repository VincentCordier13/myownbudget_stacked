import 'package:myownbudget_stacked/app/locator.dart';
import 'package:myownbudget_stacked/models/account.dart';
import 'package:myownbudget_stacked/models/tools/icon_tool.dart';
import 'package:myownbudget_stacked/models/tools/money_tool.dart';
import 'package:myownbudget_stacked/services/accounts_service.dart';
import 'package:stacked/stacked.dart';

class AccountFormViewModel extends BaseViewModel {
  final _service = locator<AccountsService>();

  Account _account;
  AccountFormViewModel() {_account = new Account();}
  set name(String name) => _account.name = name;
  set imageIcon(String image) => _account.icon.image = image;
  set imageColorIcon(ImageColorEnum imageColor) => _account.icon.imageColor = imageColor;
  set backColorIcon(BackColorEnum backColor) => _account.icon.backColor = backColor;
  set amountMoney(double amount) => _account.money.amount = amount;
  set currencyMoney(CurrencyEnum currency) => _account.money.currency = currency;
  set description(String description) => _account.description = description;

  Future<int> createAccount() async {
    int response = await _service.insertAccount(_account);
    notifyListeners();
    return response;
  }
}