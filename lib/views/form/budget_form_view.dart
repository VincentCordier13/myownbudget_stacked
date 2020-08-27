import 'package:flutter/material.dart';
import 'package:myownbudget_stacked/app/locator.dart';
import 'package:myownbudget_stacked/viewmodels/form/budget_form_viewmodel.dart';
import 'package:stacked/stacked.dart';

class BudgetFormView extends StatelessWidget {
  const BudgetFormView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BudgetFormViewModel>.reactive(
      disposeViewModel: false,
      builder: (context, model, child) => Container(),
      viewModelBuilder: () => locator<BudgetFormViewModel>(),
    );
  }
}