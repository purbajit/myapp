import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'secondscreen.dart';
import 'maindrawer.dart';
// import 'loginscreen.dart';

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
      drawer: MainDrawer(),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.businesspost.ie%2Fcommercial-reports%2Fshaping-the-future-of-healthcare-2fc1b3ec&psig=AOvVaw1Dy8tE2CFoGp729NlARJ0W&ust=1596657926428000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKjrrLqsgusCFQAAAAAdAAAAABAz'),
                  fit: BoxFit.cover),
            ),
          ),
          Center(
            child: RaisedButton(
              child: Text(
                'PATIENT ISSUE MENU',
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
        ],
      ),
    );
  }
}
