import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _name;
  String _age;
  String _registrationno;
  String _address;
  String _phoneNumber;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Patient Name*'),
      maxLength: 20,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Patient Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildAge() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Patient age*'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Patient age is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _age = value;
      },
    );
  }

  Widget _buildRegistrationNo() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Registration No*'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Registration No is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _registrationno = value;
      },
    );
  }

  Widget _builAddress() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Address'),
      keyboardType: TextInputType.multiline,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Address is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _address = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number*'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _phoneNumber = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PATIENT DETAILS")),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildName(),
              _buildAge(),
              _buildRegistrationNo(),
              _builAddress(),
              _buildPhoneNumber(),
              SizedBox(height: 100),
              RaisedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }

                  _formKey.currentState.save();

                  print(_name);
                  print(_age);
                  print(_phoneNumber);
                  print(_address);
                  print(_registrationno);

                  //Send to API
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
