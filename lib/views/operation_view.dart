import 'package:flutter/material.dart';
import 'package:myownbudget_stacked/app/locator.dart';
import 'package:myownbudget_stacked/viewmodels/operation_viewmodel.dart';
import 'package:stacked/stacked.dart';

class OperationView extends StatelessWidget {
  const OperationView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OperationsViewModel>.reactive(
      disposeViewModel: false,
      builder: (context, model, child) => Container(),
      viewModelBuilder: () => locator<OperationsViewModel>(),
    );
  }
}