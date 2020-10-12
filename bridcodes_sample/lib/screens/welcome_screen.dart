import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final whiteTextTheme = Theme.of(context)
        .textTheme
        .apply(bodyColor: Colors.white, displayColor: Colors.white);
    final blueTextTheme = Theme.of(context).textTheme.apply(
        bodyColor: Theme.of(context).primaryColor,
        displayColor: Theme.of(context).primaryColor);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 60),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Welcome', style: whiteTextTheme.headline),
            SizedBox(height: 12),
            Text(
              'Manage your business',
              style: whiteTextTheme.body1,
            ),
            Text('seamlessly & intuitively', style: whiteTextTheme.body2),
            SizedBox(height: 22),
            Container(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                child: Text(
                  'Sign in with Google',
                  style: blueTextTheme.body2,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                onPressed: () {},
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Create an Account',
                  style: whiteTextTheme.body2,
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(8)),
                onPressed: () {
                  Navigator.pushNamed(context, 'signup_screen');
                },
              ),
            ),
            SizedBox(height: 18),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Already have an account? ',
                  style: TextStyle(color: Colors.white),
                ),
                FlatButton(
                  child: Text(
                    'Sign in ',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () => Navigator.pushNamed(context, 'signin_screen')
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
