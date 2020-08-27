import 'package:flutter/material.dart';
import 'package:myownbudget_stacked/app/locator.dart';
import 'package:myownbudget_stacked/viewmodels/form/operation_form_viewmodel.dart';
import 'package:stacked/stacked.dart';

class OperationFormView extends StatelessWidget {
  const OperationFormView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OperationFormViewModel>.reactive(
      disposeViewModel: false,
      builder: (context, model, child) => Container(),
      viewModelBuilder: () => locator<OperationFormViewModel>(),
    );
  }
}