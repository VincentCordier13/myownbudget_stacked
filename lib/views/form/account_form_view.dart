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
    return ViewModelBuilder<AccountFormViewModel>.reactive(
      builder: (context, viewmodel, child) => Opacity(
        opacity: 0.5,
        child: Container(
          alignment: Alignment.center,
          child: new RaisedButton(
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
          )
        ),
      ),
      viewModelBuilder: () => locator<AccountFormViewModel>(),
    );
  }
}