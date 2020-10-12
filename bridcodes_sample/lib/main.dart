import 'package:bridcodes_sample/screens/home_screen.dart';
import 'package:bridcodes_sample/screens/signin_screen.dart';
import 'package:bridcodes_sample/screens/signup_screen.dart';
import 'package:bridcodes_sample/screens/welcome_screen.dart';
import 'package:bridcodes_sample/widgets/theme_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:theme_provider/theme_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _initialization = Firebase.initializeApp();

    return ThemeProvider(
      defaultThemeId: 'light_theme',
      saveThemesOnChange: true,
      loadThemeOnInit: false,
      onInitCallback: (controller, previouslySavedThemeFuture) async {
        String savedTheme = await previouslySavedThemeFuture;
        if (savedTheme != null) {
          controller.setTheme(savedTheme);
        } else {
          Brightness platformBrightness =
              SchedulerBinding.instance.window.platformBrightness;
          if (platformBrightness == Brightness.dark) {
            controller.setTheme('dark');
          } else {
            controller.setTheme('light');
          }
          controller.forgetSavedTheme();
        }
      },
      themes: [LightAppTheme, DarkAppTheme],
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) {
            return MaterialApp(
              title: 'BridcodesSampleApp',
              theme: ThemeProvider.themeOf(themeContext).data,
              home: FutureBuilder(
                future: _initialization,
                builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                    body: Center(child: Text('Error Occurred')));
              } else {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Scaffold(
                      body: Center(child: CircularProgressIndicator()));
                } else {
                  return FutureBuilder(
                      future: DecidePage(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.done) {
                          return snapshot.data;
                        } else {
                          return Scaffold();
                        }
                      });
                }
              }
                },
              ),
              routes: {
                'welcome_screen': (context) => WelcomePage(),
                'signin_screen': (context) => SigninPage(),
                'signup_screen': (context) => SignupPage(),
                'home_screen': (context) => HomePage(),
              },
            );
          },
        ),
      ),
    );
  }
}

Future<Widget> DecidePage() async {
  User user = await FirebaseAuth.instance.currentUser;
  if (user == null) {
    return WelcomePage();
  } else {
    return HomePage(user: user);
  }
}
