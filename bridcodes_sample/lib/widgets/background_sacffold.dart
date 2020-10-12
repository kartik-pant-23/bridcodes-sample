import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackgroundScaffold extends StatelessWidget {

  const BackgroundScaffold({
    Key key,
    this.title,
    this.child
  }) : super(key: key);
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(height: 60),
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white, size: 32,),
                    onPressed: () => Navigator.pop(context)
                  ),
                  SizedBox(height: 6),
                  Text(title, style: TextStyle(
                    color: Colors.white, fontSize: 22,
                    fontFamily: "Lato", fontWeight: FontWeight.w700
                  ),),
                  SizedBox(height: 40)
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))
                ),
                child: child,
              ),
            )
          ],
        ),
      ),
    );
  }
}
