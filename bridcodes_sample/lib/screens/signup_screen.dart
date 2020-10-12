import 'package:bridcodes_sample/screens/otp_screen.dart';
import 'package:bridcodes_sample/services/firebase_auth.dart';
import 'package:bridcodes_sample/widgets/background_sacffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  // Parameters
  String _name, _email, _password, _phoneNumber;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final greyTextTheme = Theme.of(context).textTheme
        .apply(displayColor: Color(0xFFABABAB), bodyColor: Color(0xFFABABAB));
    final blueTextTheme = Theme.of(context).textTheme
        .apply(displayColor: Theme.of(context).primaryColor, bodyColor: Theme.of(context).primaryColor);
    final whiteTextTheme = Theme.of(context).textTheme
        .apply(displayColor: Colors.white, bodyColor: Colors.white);

    Widget _buildName() {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Name', style: greyTextTheme.bodyText2,),
            TextFormField(
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
              style: Theme.of(context).textTheme.bodyText2,
              decoration: InputDecoration(
                  hintText: 'Enter your Business Name',
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
                _name = value;
              },
            )
          ],
        ),
      );
    }
    Widget _buildEmail() {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Email', style: greyTextTheme.bodyText2,),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              style: Theme.of(context).textTheme.bodyText2,
              decoration: InputDecoration(
                  hintText: 'Enter your Business Email',
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
    Widget _buildPhoneNumber() {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Mobile Number', style: greyTextTheme.bodyText2,),
            TextFormField(
              keyboardType: TextInputType.phone,
              style: Theme.of(context).textTheme.bodyText2,
              decoration: InputDecoration(
                  hintText: '+91-xxxxxxxxxx',
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
                _phoneNumber = value;
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
                  hintText: 'Enter your Password',
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
      title: 'Create Account',
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50),
              Text('Welcome Back', style: Theme.of(context).textTheme.headline5,),
              Text('Hello there, sign up to continue', style: greyTextTheme.bodyText1,),
              SizedBox(height: 40),
              Form(
                key: _formKey,
                  child: Column(
                    children: <Widget>[
                      _buildName(),
                      SizedBox(height: 10),
                      _buildEmail(),
                      SizedBox(height: 10),
                      _buildPhoneNumber(),
                      SizedBox(height: 10),
                      _buildPassword(),
                    ],
                  )
              ),
              Text('By creating an account you agree to our', style: TextStyle(color: Color(0xFFABABAB), fontSize: 11)),
              GestureDetector(
                child: Text('terms and conditions', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 11, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'Sign up',
                    style: whiteTextTheme.bodyText1,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: () {
                    if(!_formKey.currentState.validate()){
                      return;
                    }
                    _formKey.currentState.save();
                    onSignupClick();
                  },
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Already have an account? ',
                    style: TextStyle(color: Color(0xFFABABAB)),
                  ),
                  FlatButton(
                      padding: EdgeInsets.all(0),
                      child: Text(
                        'Sign in',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () => Navigator.popAndPushNamed(context, 'signin_screen')
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

  void onSignupClick() {
    FirebaseAuthentication authentication = new FirebaseAuthentication(
      name: _name,
      email: _email,
      phoneNumber: _phoneNumber,
      codeSent: (String verificationId, [int forceResendingToken]){
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OTPPage(
            name: _name,
            email: _email,
            verificationId: verificationId
          )
        ));
      },
      context: context
    );
    authentication.signUpWithPhoneNumber();
  }

}
