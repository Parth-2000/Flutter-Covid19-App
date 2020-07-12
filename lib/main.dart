// Importing the Pakages
import 'dart:ui';
import 'package:covid19/homepage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(new MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.grey,
      appBarTheme: AppBarTheme(
        color: Colors.white,
      ),
    ),
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: HomePage(),
        title: new Text(
          'Covid 19',
          style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50.0,
            letterSpacing: 2.0,
            color: Colors.deepOrange,
          ),
          textScaleFactor: 1.5,
        ),
        image: new Image.asset('images/covid19logo.png'),
        backgroundColor: Colors.black,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print("Splash Screen Logo is Clicked"),
        loaderColor: Colors.red,
      ),
    );
  }
}
