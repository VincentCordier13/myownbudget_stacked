import 'package:get_it/get_it.dart';
import 'package:myownbudget_stacked/services/accounts_service.dart';
import 'package:myownbudget_stacked/services/api/sql_api_service.dart';
import 'package:myownbudget_stacked/services/budgets_service.dart';
import 'package:myownbudget_stacked/services/operations_service.dart';
import 'package:myownbudget_stacked/viewModels/home_viewmodel.dart';
import 'package:myownbudget_stacked/viewmodels/accounts_viewmodel.dart';
import 'package:myownbudget_stacked/viewmodels/budgets_viewmodel.dart';
import 'package:myownbudget_stacked/viewmodels/form/account_form_viewmodel.dart';
import 'package:myownbudget_stacked/viewmodels/form/budget_form_viewmodel.dart';
import 'package:myownbudget_stacked/viewmodels/form/operation_form_viewmodel.dart';
import 'package:myownbudget_stacked/viewmodels/operations_viewmodel.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => HomeViewModel());
  locator.registerLazySingleton(() => AccountsViewModel());
  locator.registerLazySingleton(() => BudgetsViewModel());
  locator.registerLazySingleton(() => OperationsViewModel());
  locator.registerFactory(() => AccountFormViewModel());
  locator.registerFactory(() => BudgetFormViewModel());
  locator.registerFactory(() => OperationFormViewModel());

  locator.registerLazySingleton(() => SqlApiService());
  locator.registerLazySingleton(() => AccountsService());
  locator.registerLazySingleton(() => BudgetsService());
  locator.registerLazySingleton(() => OperationsService());
}
