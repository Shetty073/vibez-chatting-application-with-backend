import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibez/screens/home_screen.dart';
import 'package:vibez/screens/loading_screen.dart';
import 'package:vibez/screens/sign_in_screen.dart';
import 'package:vibez/screens/sign_up_screen.dart';
import 'package:vibez/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Vibez',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: '/loading',
      routes: {
        '/loading': (context) => LoadingScreen(),
        '/sign_up': (context) => SignUpScreen(),
        '/sign_in': (context) => SignInScreen(),
        '/': (context) => HomeScreen(),
      },
    );
  }
}
