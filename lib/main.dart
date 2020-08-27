import 'package:flutter/material.dart';
import 'package:myownbudget_stacked/app/locator.dart';
import 'package:myownbudget_stacked/app/router.dart';


void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      onGenerateRoute: Router.generateRoute,
    );
  }
}