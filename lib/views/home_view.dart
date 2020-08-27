import 'package:flutter/material.dart';
import 'package:myownbudget_stacked/ViewModels/home_viewmodel.dart';
import 'package:myownbudget_stacked/views/account_view.dart';
import 'package:myownbudget_stacked/views/budget_view.dart';
import 'package:myownbudget_stacked/views/form/account_form_view.dart';
import 'package:myownbudget_stacked/views/form/budget_form_view.dart';
import 'package:myownbudget_stacked/views/form/operation_form_view.dart';
import 'package:myownbudget_stacked/views/operation_view.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("HomeView built");
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, viewmodel, child) => Scaffold(
        appBar: appBar(context, viewmodel.currentIndex),
        body: body(viewmodel.currentIndex),
        bottomNavigationBar: bottomNavigationBar(viewmodel, viewmodel.currentIndex),
        floatingActionButton: floatingActionButton(context, viewmodel.currentIndex),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }

  Widget appBar(BuildContext context, int currentIndex) {
    List<String> titleOptions = <String>[
      "Opérations",
      "Budgets",
      "Comptes",
    ];
    List<Widget> operationActions = new List<Widget>();
    operationActions.add(new IconButton(
        icon: Icon(Icons.av_timer),
        onPressed: () { Navigator.pushNamed(context, 'operationauto'); }
    ));
    List<Widget> budgetActions = new List<Widget>();
    budgetActions.add(new IconButton(
        icon: Icon(Icons.av_timer),
        onPressed: () { Navigator.pushNamed(context, 'category'); }
    ));
    List<Widget> accountAction = new List<Widget>();
    accountAction.add(new IconButton(
        icon: Icon(Icons.av_timer),
        onPressed: () { Navigator.pushNamed(context, 'autre'); }
    ));
    List<List<Widget>> actionsOptions = <List<Widget>>[
      operationActions,
      budgetActions,
      accountAction,
    ];
    return new AppBar(
      title: Text(titleOptions.elementAt(currentIndex)),
      titleSpacing: 25,
      backgroundColor: Color(0xFFDFAE20),
      actions: actionsOptions.elementAt(currentIndex),
    );
  }

  Widget body(int currentIndex) {
    List<Widget> pageOptions = <Widget>[
      OperationView(),
      BudgetView(),
      AccountView(),
    ];
    return new Container(
      color: Color(0xFFF2F1F1),
      child: pageOptions.elementAt(currentIndex),
    );
  }

  Widget bottomNavigationBar(IndexTrackingViewModel viewmodel, int currentIndex) {
    return new BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.euro_symbol),
          title: Text('Opération'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet),
          title: Text('Budget'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance),
          title: Text('Compte'),
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Color(0xFFDFAE20),
      onTap: viewmodel.setIndex,
    );
  }

  FloatingActionButton floatingActionButton(BuildContext context, int currentIdex) {
    List<Widget> floatingOptions = <Widget>[
      OperationFormView(),
      BudgetFormView(),
      AccountFormView(),
    ];
    return new FloatingActionButton(
      onPressed: () {
        print("View : onPressed floatingButton");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    floatingOptions.elementAt(currentIdex)));
      },
      child: Icon(Icons.add_circle, size: 45),
      backgroundColor: Color(0xFFDFAE20),
    );
  }

}

