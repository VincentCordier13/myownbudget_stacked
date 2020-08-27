import 'package:flutter/material.dart';
import 'package:myownbudget_stacked/app/locator.dart';
import 'package:myownbudget_stacked/viewmodels/form/account_form_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AccountFormView extends StatelessWidget {
  const AccountFormView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AccountFormViewModel>.reactive(
      disposeViewModel: false,
      builder: (context, model, child) => Container(),
      viewModelBuilder: () => locator<AccountFormViewModel>(),
    );
  }
}