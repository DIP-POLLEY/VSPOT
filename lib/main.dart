import 'package:flutter/material.dart';
import 'package:vspot/screens/homepage.dart';
import 'package:vspot/screens/welcome.dart';
import 'package:vspot/utilities/users.dart';
String p;
void main()  {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        Home_screen.id: (context) => Home_screen(),
      },
    );
  }
}
