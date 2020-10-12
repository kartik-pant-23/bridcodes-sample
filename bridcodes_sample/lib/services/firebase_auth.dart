import 'package:bridcodes_sample/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirebaseAuthentication{

  FirebaseAuth _auth = FirebaseAuth.instance;
  final String name, email, phoneNumber;
  final Function codeSent;
  final BuildContext context;
  FirebaseAuthentication({this.name, this.email, this.phoneNumber, this.codeSent, this.context});

  signUpWithPhoneNumber() async {

    _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async{
          UserCredential userCredential = await _auth.signInWithCredential(credential);
          User user = userCredential.user;
          if(user != null) {
            await user.updateEmail(email);
            await user.updateProfile(displayName: name);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => HomePage(user: user)),
                (Route<dynamic> route) => false
            );
          } else {
            showSnackbar("Unknown error occurred");
          }
        },
        verificationFailed: (FirebaseAuthException exception) {
          showSnackbar(exception.message);
        },
        codeSent: codeSent,
        codeAutoRetrievalTimeout: (String message) {
          print(message);
        }
    );
  }

  void showSnackbar(String message) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Center(child: Text(message, style: TextStyle(color: Colors.white))),
        backgroundColor: Theme.of(context).primaryColor,
      )
    );
  }
}