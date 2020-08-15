import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:guist/screens/Homescreen.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 8,
      backgroundColor: Colors.black,
      image: Image.asset('assets/giphy.gif'),
      loaderColor: Colors.white,
      photoSize: 150.0,
      navigateAfterSeconds: Homescreen(),
    );
  }
}
