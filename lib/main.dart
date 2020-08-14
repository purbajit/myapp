import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'secondscreen.dart';
import 'maindrawer.dart';

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
                      'https://img.resized.co/businesspost/eyJkYXRhIjoie1widXJsXCI6XCJodHRwOlxcXC9cXFwvaW1lbmdpbmUucHVibGljLnByb2Quc2JwLmluZm9tYWtlci5pbz91dWlkPWM2YjNiOGRiLTZmMTktNTI3MS05ZjlkLWZlOTJiZWRhNDAzMyZ0eXBlPXByZXZpZXcmcT04MCZmdW5jdGlvbj1vcmlnaW5hbFwiLFwid2lkdGhcIjo3NjUsXCJoZWlnaHRcIjo0ODUsXCJkZWZhdWx0XCI6XCJodHRwOlxcXC9cXFwvczMtZXUtd2VzdC0xLmFtYXpvbmF3cy5jb21cXFwvc3RvcmFnZS5wdWJsaXNoZXJwbHVzLmllXFxcL21lZGlhLmJ1c2luZXNzcG9zdC5pZVxcXC9zYnAtbm8taW1hZ2UucG5nXCJ9IiwiaGFzaCI6IjhjODg1MWZmMDBjZWNjMjQ5MGY1NWQyNmNkNjQ2NmVjMDcxNGRmMmQifQ==/shaping-the-future-of-healthcare.io?uuid=c6b3b8db-6f19-5271-9f9d-fe92beda4033&type=preview&q=80&function=original'),
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
