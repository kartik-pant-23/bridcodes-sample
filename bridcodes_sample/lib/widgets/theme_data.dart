import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

final _primarySwatch = MaterialColor(0xFF155CB0, {
  50: Color.fromRGBO(21, 92, 176, 0.10),
  100: Color.fromRGBO(21, 92, 176, 0.20),
  200: Color.fromRGBO(21, 92, 176, 0.30),
  300: Color.fromRGBO(21, 92, 176, 0.40),
  400: Color.fromRGBO(21, 92, 176, 0.50),
  500: Color.fromRGBO(21, 92, 176, 0.60),
  600: Color.fromRGBO(21, 92, 176, 0.70),
  700: Color.fromRGBO(21, 92, 176, 0.80),
  800: Color.fromRGBO(21, 92, 176, 0.90),
  900: Color.fromRGBO(21, 92, 176, 1.0),
});

final LightAppTheme = AppTheme(
    id: 'light_theme',
    data: ThemeData(
      primaryColor: Color(0xFF155CB0),
      primarySwatch: _primarySwatch,
      backgroundColor: Colors.white,
      textTheme: TextTheme(
          headline5: TextStyle(
              fontSize: 20, fontFamily: "Lato", fontWeight: FontWeight.w700),
          bodyText1: TextStyle(fontSize: 14, fontFamily: "Lato"),
          bodyText2: TextStyle(
              fontSize: 14, fontFamily: "Lato", fontWeight: FontWeight.w700)),
    ),
    description: 'This is the light theme'
);

final DarkAppTheme = AppTheme(
    id: 'dark_theme',
    data: ThemeData(
      scaffoldBackgroundColor: Color(0xFF1D2951),
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: _primarySwatch.shade400,
          modalBackgroundColor: _primarySwatch.shade400),
      backgroundColor: Color(0xFF1D2951),
      primaryColor: Color(0xFF155CB0),
      primarySwatch: _primarySwatch,
      textTheme: TextTheme(
          headline5: TextStyle(
              fontSize: 20,
              fontFamily: "Lato",
              fontWeight: FontWeight.w700,
              color: Colors.white),
          bodyText1:
              TextStyle(fontSize: 14, fontFamily: "Lato", color: Colors.white),
          bodyText2: TextStyle(
              fontSize: 14,
              fontFamily: "Lato",
              fontWeight: FontWeight.w700,
              color: Colors.white)),
      iconTheme: IconThemeData(
        color: Colors.white
      )
    ),
    description: 'This is the dark theme'
);
