import 'package:myownbudget_stacked/app/locator.dart';
import 'package:myownbudget_stacked/models/account.dart';
import 'package:myownbudget_stacked/models/tools/icon_tool.dart';
import 'package:myownbudget_stacked/models/tools/money_tool.dart';
import 'package:myownbudget_stacked/services/accounts_service.dart';
import 'package:stacked/stacked.dart';

class AccountFormViewModel extends ReactiveViewModel  {
  final _service = locator<AccountsService>();
  @override
  List<ReactiveServiceMixin> get reactiveServices => [_service];

  Account _account;
  AccountFormViewModel() : _account = new Account();

  set name(String name) => _account.name = name;
  set imageIcon(String image) => _account.icon = new IconClass.setImage(image: image);
  set imageColorIcon(ImageColorEnum imageColor) => _account.icon.setImageColor = imageColor;
  set backColorIcon(BackColorEnum backColor) => _account.icon.setBackColor = backColor;
  set currencyMoney(CurrencyEnum currency) => _account.money = new MoneyClass.setCurrency(currency: currency);
  set amountMoney(double amount) => _account.money.setAmount = amount;
  set description(String description) => _account.description = description;

  Future<int> createAccount() async {
    int response = await _service.insertAccount(_account);
    notifyListeners();
    return response;
  }

  Future<void> removeDatabase() async {
    await _service.removeAccountDatabase(); 
    notifyListeners();
  }
}