import 'package:flutter/material.dart';
import 'package:myownbudget_stacked/app/locator.dart';
import 'package:myownbudget_stacked/viewmodels/operations_viewmodel.dart';
import 'package:stacked/stacked.dart';

class OperationView extends StatelessWidget {
  const OperationView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("OperationView built");
    return ViewModelBuilder<OperationsViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) => Container(),
      viewModelBuilder: () => locator<OperationsViewModel>(),
    );
  }
}