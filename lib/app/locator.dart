import 'package:get_it/get_it.dart';
import 'package:myownbudget_stacked/viewModels/home_viewmodel.dart';
import 'package:myownbudget_stacked/viewmodels/account_viewmodel.dart';
import 'package:myownbudget_stacked/viewmodels/budget_viewmodel.dart';
import 'package:myownbudget_stacked/viewmodels/form/account_form_viewmodel.dart';
import 'package:myownbudget_stacked/viewmodels/form/budget_form_viewmodel.dart';
import 'package:myownbudget_stacked/viewmodels/form/operation_form_viewmodel.dart';
import 'package:myownbudget_stacked/viewmodels/operation_viewmodel.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(HomeViewModel());
  locator.registerSingleton(AccountsViewModel());
  locator.registerSingleton(BudgetsViewModel());
  locator.registerSingleton(OperationsViewModel());
  locator.registerSingleton(AccountFormViewModel());
  locator.registerSingleton(BudgetFormViewModel());
  locator.registerSingleton(OperationFormViewModel());
}
