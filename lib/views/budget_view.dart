import 'package:flutter/material.dart';
import 'package:myownbudget_stacked/app/locator.dart';
import 'package:myownbudget_stacked/viewmodels/budget_viewmodel.dart';
import 'package:stacked/stacked.dart';

class BudgetView extends StatelessWidget {
  const BudgetView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BudgetsViewModel>.reactive(
      disposeViewModel: false,
      builder: (context, model, child) => Container(),
      viewModelBuilder: () => locator<BudgetsViewModel>(),
    );
  }
}