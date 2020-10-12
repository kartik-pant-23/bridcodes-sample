import 'package:bridcodes_sample/widgets/background_sacffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {

  // Parameters
  String _email, _password;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final greyTextTheme = Theme.of(context).textTheme
      .apply(displayColor: Color(0xFFABABAB), bodyColor: Color(0xFFABABAB));
    final blueTextTheme = Theme.of(context).textTheme
        .apply(displayColor: Theme.of(context).primaryColor, bodyColor: Theme.of(context).primaryColor);
    final whiteTextTheme = Theme.of(context).textTheme
        .apply(displayColor: Colors.white, bodyColor: Colors.white);


    Widget _buildEmail() {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Username or Email', style: greyTextTheme.bodyText2,),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              style: Theme.of(context).textTheme.bodyText2,
              decoration: InputDecoration(
                  hintText: 'Enter username or email',
                  hintStyle: greyTextTheme.bodyText2,
                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  filled: true,
                  fillColor: Color.fromRGBO(171, 171, 171, 0.50),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none)
              ),
              validator: (value){
                if(value.isEmpty)
                  return 'Field is required';
                return null;
              },
              onSaved: (value){
                _email = value;
              },
            )
          ],
        ),
      );
    }
    Widget _buildPassword() {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Password', style: greyTextTheme.bodyText2,),
            TextFormField(
              obscureText: true,
              style: Theme.of(context).textTheme.bodyText2,
              decoration: InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: greyTextTheme.bodyText2,
                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  filled: true,
                  fillColor: Color.fromRGBO(171, 171, 171, 0.50),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none)
              ),
              validator: (value){
                if(value.isEmpty)
                  return 'Field is required';
                return null;
              },
              onSaved: (value){
                _password = value;
              },
            )
          ],
        ),
      );
    }

    return BackgroundScaffold(
      title: 'Welcome',
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50),
              Text('Welcome', style: Theme.of(context).textTheme.headline5,),
              Text('Hello there, signin to continue', style: greyTextTheme.bodyText1,),
              SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    _buildEmail(),
                    SizedBox(height: 10),
                    _buildPassword()
                  ],
                )
              ),
              FlatButton(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                child: Text('Forgot password?', style: blueTextTheme.bodyText2),
                onPressed: (){},
              ),
              SizedBox(height: 65),
              Container(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'Sign in',
                    style: whiteTextTheme.bodyText1,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: () {
                    if(!_formKey.currentState.validate()) {
                      return;
                    }
                    _formKey.currentState.save();
                    onSigninClick();
                  },
                ),
              ),
              SizedBox(height: 120),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Don\'t have an account? ',
                    style: TextStyle(color: Color(0xFFABABAB)),
                  ),
                  FlatButton(
                    padding: EdgeInsets.all(0),
                      child: Text(
                        'Sign up',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () => Navigator.popAndPushNamed(context, 'signup_screen')
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void onSigninClick() {
  }

}
