import 'package:get_it/get_it.dart';
import 'package:myownbudget_stacked/ViewModels/home_viewmodel.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(HomeViewModel());
}