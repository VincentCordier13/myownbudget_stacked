import 'package:flutter/material.dart';
import 'package:myownbudget_stacked/ViewModels/home_viewmodel.dart';
import 'package:myownbudget_stacked/views/accounts_view.dart';
import 'package:myownbudget_stacked/views/budgets_view.dart';
import 'package:myownbudget_stacked/views/form/account_form_view.dart';
import 'package:myownbudget_stacked/views/form/budget_form_view.dart';
import 'package:myownbudget_stacked/views/form/operation_form_view.dart';
import 'package:myownbudget_stacked/views/operations_view.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {

   
    

  @override
  Widget build(BuildContext context) {
    print("HomeView built");
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, viewmodel, child) {
        List<String> titleOptions = <String>[
          "Opérations",
          "Budgets",  
          "Comptes",
        ];
        List<List<Widget>> appBarActionsOptions = <List<Widget>> [
          <Widget> [
            IconButton(
              icon: Icon(Icons.av_timer),
              onPressed: () { Navigator.pushNamed(context, 'operationauto'); }
            ),
          ],
          <Widget> [
            IconButton(
              icon: Icon(Icons.av_timer),
              onPressed: () { Navigator.pushNamed(context, 'category'); }
            )
          ],
          <Widget> [
            IconButton(
              icon: Icon(Icons.av_timer),
              onPressed: () { Navigator.pushNamed(context, 'autre'); }
            )
          ],
        ];
        List<Widget> bodyOptions = <Widget>[
          OperationView(),
          BudgetView(),
          AccountView(),
        ];
        List<Widget> floatingActionOptions = <Widget>[
          OperationFormView(),
          BudgetFormView(),
          AccountFormView(),
        ];

        return Scaffold(
          appBar: AppBar(
            title: Text(titleOptions.elementAt(viewmodel.currentIndex)),
            titleSpacing: 25,
            backgroundColor: Color(0xFFDFAE20),
            actions: appBarActionsOptions.elementAt(viewmodel.currentIndex),
          ),
          body: Container(
            color: Color(0xFFF2F1F1),
            child: bodyOptions.elementAt(viewmodel.currentIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
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
            currentIndex: viewmodel.currentIndex,
            selectedItemColor: Color(0xFFDFAE20),
            onTap: viewmodel.setIndex,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          floatingActionOptions.elementAt(viewmodel.currentIndex)));
            },
            child: Icon(Icons.add_circle, size: 45),
            backgroundColor: Color(0xFFDFAE20),
          ),
        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}

