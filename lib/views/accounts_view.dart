import 'package:flutter/material.dart';
import 'package:myownbudget_stacked/app/locator.dart';
import 'package:myownbudget_stacked/viewmodels/accounts_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("AccountView built");
    return ViewModelBuilder<AccountsViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, viewmodel, child) {
        return new Container(
          child: viewmodel.isBusy 
            ? new Center(child: CircularProgressIndicator())
            : new ListView.custom(
              childrenDelegate: SliverChildBuilderDelegate(
                (context, index) {
                  return new Center(
                    child: new ListTile(
                      dense: false,
                      leading: new CircleAvatar(
                        backgroundColor: viewmodel.accounts[index].icon.getBackColor,
                        child:
                          new Image.asset('${viewmodel.accounts[index].icon.image}', 
                            color: viewmodel.accounts[index].icon.getImageColor,
                            height: 25,
                            width: 25,
                          ),
                      ),
                      title: new Text('${viewmodel.accounts[index].name}',
                        style: TextStyle(
                          fontSize: 20, 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: viewmodel.accounts[index].description != "" ?
                        new Text('${viewmodel.accounts[index].description}',
                          style: TextStyle(
                            fontSize: 15, 
                          ),
                        ) : null,
                      trailing: new Text('${viewmodel.accounts[index].money}',
                        style: TextStyle(
                          fontSize: 20, 
                        ),
                      ), 
                      onTap: () {
                        print('${viewmodel.accounts[index].name}');
                        showModalBottomSheet( 
                          context: context, 
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            //return AccountDetails(account: viewmodel);
                            return Container();
                          }
                        );
                      },
                    ),
                  );
                },
                childCount: viewmodel.accounts.length,
              )
            ),
        );
      },
      viewModelBuilder: () => locator<AccountsViewModel>(),
    );
  }
}
