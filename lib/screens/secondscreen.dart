import 'package:flutter/material.dart';
import 'dropdown_formfield.dart';
//import 'package:guist/services/httpservice.dart';
import 'package:guist/services/api.dart';
// import 'dart:async';
// import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class Secondscreen extends StatelessWidget {
  String _programList;
  String _programListResult;
  final formKey = new GlobalKey<FormState>();

  void initState() {
    initState();
    _programList = '';
    _programListResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _programListResult = _programList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INDENT DRUGS'),
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
                  titleText: 'Your Store',
                  hintText: 'Please choose one',
                  value: _programList,
                  onSaved: (value) {
                    setState(() {
                      _programList = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _programList = value;
                    });
                  },
                  dataSource: [
                    {
                      API(),
                    }
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: DropDownFormField(
                  titleText: 'Parent Store',
                  hintText: 'Please choose one',
                  value: _programList,
                  onSaved: (value) {
                    setState(() {
                      _programList = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _programList = value;
                    });
                  },
                  dataSource: [
                    {
                      API(),
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: DropDownFormField(
                  titleText: 'Office Indent/Letter No',
                  hintText: 'Please choose one',
                  value: _programList,
                  onSaved: (value) {
                    setState(() {
                      _programList = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _programList = value;
                    });
                  },
                  dataSource: [
                    {
                      API(),
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: DropDownFormField(
                  titleText: 'Select Program*',
                  hintText: 'Please choose one',
                  value: _programList,
                  onSaved: (value) {
                    setState(() {
                      _programList = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _programList = value;
                    });
                  },
                  dataSource: [
                    {
                      API(),
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: RaisedButton(
                  child: Text('Save'),
                  onPressed: _saveForm,
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text(_programListResult),
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
