import 'package:bridcodes_sample/screens/home_screen.dart';
import 'package:bridcodes_sample/widgets/background_sacffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OTPPage extends StatefulWidget {
  final String name, email, verificationId;
  OTPPage({this.name, this.email, this.verificationId});
  @override
  _OTPPageState createState() => _OTPPageState(name, email, verificationId);
}

class _OTPPageState extends State<OTPPage> {

  // Parameters
  String _code, _name, _email, _verificationId;
  final _formKey = GlobalKey<FormState>();

  _OTPPageState(this._name, this._email, this._verificationId);

  @override
  Widget build(BuildContext context) {

    final greyTextTheme = Theme.of(context).textTheme
        .apply(displayColor: Color(0xFFABABAB), bodyColor: Color(0xFFABABAB));
    final whiteTextTheme = Theme.of(context).textTheme
        .apply(displayColor: Colors.white, bodyColor: Colors.white);


    Widget _buildOtp() {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              style: Theme.of(context).textTheme.bodyText2,
              decoration: InputDecoration(
                  hintText: 'Verification Code',
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
                _code = value;
              },
            )
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
              Text('OTP Verification', style: Theme.of(context).textTheme.headline5,),
              Text('Have you received a four digit\nVerification Code', style: greyTextTheme.bodyText1,),
              SizedBox(height: 40),
              Form(
                  key: _formKey,
                  child: _buildOtp()
              ),
              SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'Verify',
                    style: whiteTextTheme.bodyText1,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: () {
                    if(!_formKey.currentState.validate()) {
                      return;
                    }
                    _formKey.currentState.save();
                    onVerifyClick();
                  },
                ),
              ),
              SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }

  void onVerifyClick() async {
    AuthCredential _credential = PhoneAuthProvider.credential(verificationId: _verificationId, smsCode: _code);
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(_credential);
    User user = userCredential.user;
    if(user != null){
      await user.updateEmail(_email);
      await user.updateProfile(displayName: _name);
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomePage(user: user)),
        (Route<dynamic> route) => false
      );
    } else {
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text('Some error occurred'))
      );
    }
  }

}
