import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'secondscreen.dart';

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

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        title: Text("Homescreen"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: Center(
        child: RaisedButton(
          child: Text(
            'Next screen',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          color: new Color(0xff622F74),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Secondscreen()),
            );
          },
        ),
      ),
    );
  }
}
