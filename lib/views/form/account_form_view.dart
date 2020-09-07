import 'package:flutter/material.dart';
import 'package:myownbudget_stacked/app/locator.dart';
import 'package:myownbudget_stacked/models/tools/icon_tool.dart';
import 'package:myownbudget_stacked/models/tools/money_tool.dart';
import 'package:myownbudget_stacked/viewmodels/form/account_form_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AccountFormView extends StatelessWidget {
  const AccountFormView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("AccountFormView built");
    return ViewModelBuilder<AccountFormViewModel>.reactive(
      builder: (context, viewmodel, child) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new RaisedButton(
            child: Text('createAccount'),
            onPressed: () {
              viewmodel.name = "Caisse d'épargne";
              viewmodel.imageIcon = "";
              viewmodel.imageColorIcon = ImageColorEnum.black;
              viewmodel.backColorIcon = BackColorEnum.red;
              viewmodel.amountMoney = 1000.0;
              viewmodel.currencyMoney = CurrencyEnum.euros;
              viewmodel.description = "";
              viewmodel.createAccount();

              Navigator.pop(context);
            }
          ),
          new RaisedButton(
            child: Text('removeAccountDatabase'),
            onPressed: () {
              viewmodel.removeDatabase();

              Navigator.pop(context);
            }
          ),
        ],
      ),
      viewModelBuilder: () => locator<AccountFormViewModel>(),
    );
  }
}
