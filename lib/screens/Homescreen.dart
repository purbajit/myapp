import 'package:flutter/material.dart';
import 'package:guist/models/Drug.dart';
// import 'package:guist/models/Drug.dart';
import 'package:guist/services/httpservice.dart';
import 'secondscreen.dart';
import 'maindrawer.dart';
// import 'package:guist/screens/ListItem.dart';

// ignore: must_be_immutable
class Homescreen extends StatelessWidget {
  var httpService = HttpService();
  // int _counter = 0;
  final ScrollController _scrollController = ScrollController();
  // bool _stop = false;
  // List<Widget> _listMedicines = [];

  @override
  // ignore: override_on_non_overriding_member
  void dispose() {
    // ignore: todo

    _scrollController.dispose();
    // super.dispose();
  }

  // void initState() {
  //   _loadMedicines();
  //   _scrollController.addListener(() {
  //     if (_scrollController.position.pixels ==
  //         _scrollController.position.maxScrollExtent) {
  //       if (!_stop) {
  //         _loadMedicines();
  //       }
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          title: Text("Homescreen"),
          elevation: 0,
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
          //   children: <Widget>[
          //     Container(
          //   decoration: BoxDecoration(color: Colors.white),

          //                 RefreshIndicator(
          //     onRefresh: () async {
          //       setState(() {
          //                       _listMedicines = [];
          //                       _stop = false;
          //                       _counter =0;
          //                       _loadMedicines();
          //                     });
          //                   },
          //                   child: ListView.builder(
          //                     controller: _scrollController,
          //                     itemCount: _listMedicines.length,
          //                     itemBuilder: (context,i){
          //                       return _listMedicines[i];
          //                     },
          //                   ),
          //                 ),
          //               ],

          // ),
        ));
  }

//   _loadMedicines() {
//     _counter++;
//     setState(() {
//       _listMedicines.add(FutureBuilder<Drug>(
//         future: httpService.getData(pageNo: _counter),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             if (snapshot.hasData) {
//               _stop = false;
//               if (snapshot.data.data.length == 0) {
//                 _stop = true;
//                 return Center(
//                     child: Text(
//                   "No More Medicines",
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ));
//               }
//               // return Column(
//               //   children: snapshot.data.data
//               //       .map((e) => ListItem(
//               //             data: e,
//               //           ))
//               //       .toList(),
//               // );
//             }
//             return Center(
//                 child: Text(
//               "No Data",
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ));
//           }
//           _stop = true;
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ));
//     });
//   }

//   void setState(Null Function() param0) {}
}
