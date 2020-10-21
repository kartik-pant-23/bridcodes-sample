import 'package:bridcodes_sample/widgets/home_page_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:theme_provider/theme_provider.dart';

class HomePage extends StatefulWidget {
  final User user;

  HomePage({this.user});

  @override
  _HomePageState createState() => _HomePageState(user);
}

class _HomePageState extends State<HomePage> {
  User _user;

  _HomePageState(this._user);

  final List<String> menuOptions = ['Change theme', 'Sign out'];
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String _name;

  @override
  void initState() {
    super.initState();
    _name = _user.displayName ?? '';
  }

  @override
  Widget build(BuildContext context) {

    final greyTextTheme1 = Theme.of(context)
        .textTheme
        .apply(displayColor: Color(0XFFABABAB), bodyColor: Color(0XFFABABAB));
    final greyTextTheme2 = Theme.of(context).textTheme.apply(
        displayColor: Color(0XFFABABAB),
        bodyColor: Color(0XFFABABAB),
        fontSizeFactor: 0.8);

    Widget SearchView() {
      return Container(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: Theme.of(context).textTheme.bodyText2,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                hintStyle: greyTextTheme1.bodyText2,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                filled: true,
                fillColor: Color.fromRGBO(171, 171, 171, 0.50),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none)),
          ));
    }

    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80),
              Row(
                children: [
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Good Morning!', style: greyTextTheme1.headline6,),
                          Text(_name ?? '', style: Theme.of(context).textTheme.headline5),
                        ],
                      )),
                  PopupMenuButton(
                    icon: Icon(Icons.settings),
                    itemBuilder: (context) {
                      return menuOptions.map((String choice) {
                        return PopupMenuItem<String>(
                          child: Text(choice),
                          value: choice,
                        );
                      }).toList();
                    },
                    onSelected: onMenuItemSelected,
                  )
                ],
              ),
              SizedBox(height: 12.0),
              SearchView(),
              SizedBox(height: 12.0),
              Text('Projects', style: Theme.of(context).textTheme.headline5),
              Container(
                height: 250.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    String title = '', value = '';
                    if (index == 0) {
                      title = 'App Design';
                      value = '75%';
                    } else if (index == 1) {
                      title = 'Social Media';
                      value = '65%';
                    } else if (index == 2) {
                      title = 'Content Writing';
                      value = '45%';
                    }
                    return HomePageCard(title: title, value: value);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onMenuItemSelected(String choice) {
    switch (choice) {
      case 'Change theme':
        scaffoldKey.currentState.showBottomSheet(
          (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Change theme?'),
                  Text(
                    'After changing the theme, app needs to be restarted!',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12.0),
                      child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: Text('Okay, change theme.'),
                        onPressed: () {
                          changeTheme();
                        },
                      )),
                ],
              ),
            );
          },
          elevation: 12.0,
        );
        break;
      case 'Sign out':
        scaffoldKey.currentState.showBottomSheet(
          (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Sign out?'),
                  Text(
                    'After signing out, you won\'t be able to login with same number! Feature not added.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12.0),
                      child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: Text('Agree, continue sign out.'),
                        onPressed: () {
                          signOut();
                        },
                      )),
                ],
              ),
            );
          },
          elevation: 12.0,
        );
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.popAndPushNamed(context, 'welcome_screen');
  }

  void changeTheme() async {
    setState(() {
      ThemeProvider.controllerOf(context).nextTheme();
    });
  }
}
