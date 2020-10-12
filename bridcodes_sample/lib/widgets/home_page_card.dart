import 'package:flutter/material.dart';

class HomePageCard extends StatelessWidget {

  final String title, value;
  HomePageCard({this.title, this.value});

  @override
  Widget build(BuildContext context) {

    final whiteTextTheme = Theme.of(context).textTheme
    .apply(bodyColor: Colors.white, displayColor: Colors.white);

    Widget ValueIndicator(String value) {
      return CircleAvatar(
        radius: 30.0,
        backgroundColor: Colors.white.withOpacity(0.20),
        child: Center(child: Text(value, style: whiteTextTheme.bodyText2,))
      );
    }

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      color: Theme.of(context).primaryColor,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0)
      ),
      shadowColor: Colors.blueGrey.shade500,
      child: Container(
        padding: EdgeInsets.all(6.0),
        height: 230,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 30),
            ValueIndicator(value),
            Expanded(child: Container()),
            Text(title, style: whiteTextTheme.headline6, textAlign: TextAlign.center,),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
