import 'package:flutter/material.dart';
import 'package:myownbudget_stacked/app/locator.dart';
import 'package:myownbudget_stacked/viewmodels/account_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AccountsViewModel>.reactive(
      disposeViewModel: false,
      builder: (context, model, child) => Container(),
      viewModelBuilder: () => locator<AccountsViewModel>(),
    );
  }
}