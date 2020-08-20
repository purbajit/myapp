import 'package:flutter/material.dart';
//import 'package:guist/models/Drug.dart';
import 'dropdown_formfield.dart';
import 'package:guist/provider/myHomePageProvider.dart';
//import 'package:guist/services/api.dart';
import 'package:provider/provider.dart';
// import 'dart:async';
// import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class Secondscreen extends StatelessWidget {
  String programList;
  String drugList;
  String programListResult;
  final formKey = new GlobalKey<FormState>();

  void initState() {
    initState();
    programList = '';
    programListResult = '';
    drugList = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        programListResult = programList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("INDENT DRUGS"),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                child: DropDownFormField(
                  titleText: "Your Store",
                  hintText: "Please choose one",
                  value: programList,
                  onSaved: (value) {
                    setState(() {
                      programList = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      programList = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "Aizawl East DS",
                      "value": "Aizawl East DS",
                    }
                  ],
                  textField: "display",
                  valueField: "value",
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: DropDownFormField(
                  titleText: "Parent Store",
                  hintText: "Please choose one",
                  value: programList,
                  onSaved: (value) {
                    setState(() {
                      programList = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      programList = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "SWH HQ MIZORAM",
                      "value": "SWH HQ MIZORAM",
                    },
                  ],
                  textField: "display",
                  valueField: "value",
                ),
              ),
              // Container(
              //   padding: EdgeInsets.all(16),
              //   child: DropDownFormField(
              //     titleText: 'Office Indent/Letter No',
              //     hintText: 'Please choose one',
              //     value: programList,
              //     onSaved: (value) {
              //       setState(() {
              //         programList = value;
              //       });
              //     },
              //     onChanged: (value) {
              //       setState(() {
              //         programList = value;
              //       });
              //     },
              //     dataSource: [
              //       {
              //         "display":"s16193",
              //         "value": "s16193",
              //       },
              //     ],
              //     textField: 'display',
              //     valueField: 'value',
              //   ),
              // ),
              Container(
                padding: EdgeInsets.all(16),
                child: DropDownFormField(
                  titleText: "Select Program*",
                  hintText: "Please choose one",
                  value: programList,
                  onSaved: (value) {
                    setState(() {
                      programList = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      programList = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "s16193",
                      "value": "s16193",
                    },
                  ],
                  textField: "display",
                  valueField: "value",
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: DropDownFormField(
                  titleText: 'DrugList*',
                  hintText: 'Please choose one',
                  value: drugList,
                  onSaved: (value) {
                    setState(() {
                      drugList = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      drugList = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "s16193",
                      "value": "s16193",
                    },
                  ],
                  textField: "display",
                  valueField: "value",
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text("New Indent Drug Details"),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: ChangeNotifierProvider<MyHomePageProvider>(
                  create: (context) => MyHomePageProvider(),
                  child: Consumer<MyHomePageProvider>(
                    builder: (context, provider, child) {
                      if (provider.data == null) {
                        provider.getData(context);
                        return Center(child: CircularProgressIndicator());
                      }
                      // when we have the json loaded... let's put the data into a data table widget
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        // Data table widget in not scrollable so we have to wrap it in a scroll view when we have a large data set..
                        child: SingleChildScrollView(
                          child: DataTable(
                            columns: [
                              DataColumn(
                                  label: Text("DRUG ID"),
                                  tooltip: 'represents id of the drug.'),
                              DataColumn(
                                  label: Text("DRUG NAME"),
                                  tooltip: 'represents name of the drug.'),
                              DataColumn(
                                  label: Text("PROGRAMME Id"),
                                  tooltip: 'represents id of programme'),
                              DataColumn(
                                  label: Text("PROGRAMME NAME"),
                                  tooltip: 'represents name of programme'),
                              DataColumn(
                                  label: Text("PACKING DESCRIPTION"),
                                  tooltip:
                                      'represents description of packaging'),
                              DataColumn(
                                  label: Text("AVAILABLE QNTY"),
                                  tooltip:
                                      'represents qnty of drugs available'),
                            ],
                            rows: provider.data.drugList
                                .map((data) =>
                                    // we return a DataRow every time
                                    DataRow(
                                        // List<DataCell> cells is required in every row
                                        cells: [
                                          // DataCell((data.verified)
                                          //     ? Icon(
                                          //         Icons.verified_user,
                                          //         color: Colors.green,
                                          //       )
                                          //     : Icon(Icons.cancel, color: Colors.red)),
                                          // I want to display a green color icon when user is verified and red when unverified
                                          DataCell(Text(data.drugId)),
                                          DataCell(Text(data.drugName)),
                                          DataCell(Text(data.programmeId)),
                                          DataCell(Text(data.programmeName)),
                                          DataCell(
                                              Text(data.packingDescription)),
                                          DataCell(Text(data.availableQty)),
                                        ]))
                                .toList(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: RaisedButton(
                  child: Text("Save"),
                  onPressed: _saveForm,
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text("programListResult"),
              )
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void setState(Null Function()) {}
}
