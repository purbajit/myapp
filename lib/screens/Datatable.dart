import 'package:flutter/material.dart';
import 'package:guist/models/Drug.dart';
// import 'package:guist/services/httpservice.dart';
// import 'package:guist/services/api.dart';
import 'package:guist/Services.dart';
import 'dart:async';

class DataTable extends StatefulWidget {
  //
  DataTable({List<DataColumn> columns, List<DataRow> rows}) : super();

  final String title = 'PATIENT ISSUE MENU';

  @override
  DataTableState createState() => DataTableState();
}

// The Debouncer class helps to add a delay to the search
// that means when the class will wait for the user to stop for a defined time
// and then start searching
// So if the user is continuosly typing without any delay, it wont search
// This helps to keep the app more performant and if the search is directly hitting the server
// it keeps less hit on the server as well.

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer
          .cancel(); // when the user is continuosly typing, this cancels the timer
    }
    // then we will start a new timer looking for the user to stop
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class DataTableState extends State<DataTable> {
  List<Drug> _drugs;
  // this list will hold the filtered drugss
  List<Drug> _filterDrugs;
  GlobalKey<ScaffoldState> _scaffoldKey;
  // controller for the Drug Name TextField we are going to create.
  TextEditingController _drugNameController;
  TextEditingController _programmeNameController;
  TextEditingController _batchNo;
  TextEditingController _expiryDate;
  TextEditingController _manufacturingDate;
  TextEditingController _availableQnty;
  Drug _selectedDrug;
  bool _isUpdating;
  String _titleProgress;
  // This will wait for 500 milliseconds after the user has stopped typing.
  // This puts less pressure on the device while searching.
  // If the search is done on the server while typing, it keeps the
  // server hit down, thereby improving the performance and conserving
  // battery life...
  final _debouncer = Debouncer(milliseconds: 2000);
  // Lets increase the time to wait and search to 2 seconds.
  // So now its searching after 2 seconds when the user stops typing...
  // That's how we can do filtering in Flutter DataTables.

  @override
  void initState() {
    super.initState();
    _drugs = [];
    _filterDrugs = [];
    _isUpdating = false;
    _titleProgress = widget.title;
    _scaffoldKey = GlobalKey(); // key to get the context to show a SnackBar
    _drugNameController = TextEditingController();
    _programmeNameController = TextEditingController();
    _batchNo = TextEditingController();
    _expiryDate = TextEditingController();
    _manufacturingDate = TextEditingController();
    _availableQnty = TextEditingController();
    _getDrugs();
  }

  // Method to update title in the AppBar Title
  _showProgress(String message) {
    setState(() {
      _titleProgress = message;
    });
  }

  _showSnackBar(context, message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  _createTable() {
    _showProgress('Creating Table...');
    Services.createTable().then((result) {
      if ('success' == result) {
        // Table is created successfully.
        _showSnackBar(context, result);
        _showProgress(widget.title);
      }
    });
  }

  // Now lets add a drug
  _addDrug() {
    if (_drugNameController.text.isEmpty ||
        _programmeNameController.text.isEmpty) {
      print('Empty Fields');
      return;
    }
    _showProgress('Adding drug...');
    Services.addDrug(
            _drugNameController.text,
            _programmeNameController.text,
            _batchNo.text,
            _expiryDate.text,
            _manufacturingDate.text,
            _availableQnty.text)
        .then((result) {
      if ('success' == result) {
        _getDrugs(); // Refresh the List after adding each drug...
        _clearValues();
      }
    });
  }

  _getDrugs() {
    _showProgress('Loading Drugs...');
    Services.getDrugs().then((drugs) {
      setState(() {
        _drugs = drugs;
        // Initialize to the list from Server when reloading...
        _filterDrugs = drugs;
      });
      _showProgress(widget.title); // Reset the title...
      print("Length ${drugs.length}");
    });
  }

  _updateDrug(Drug drug) {
    setState(() {
      _isUpdating = true;
    });
    _showProgress('Updating Drug...');
    Services.updateDrug(
            //drug.id,
            _drugNameController.text,
            _programmeNameController.text,
            _batchNo.text,
            _expiryDate.text,
            _manufacturingDate.text,
            _availableQnty.text)
        .then((result) {
      if ('success' == result) {
        _getDrugs(); // Refresh the list after update
        setState(() {
          _isUpdating = false;
        });
        _clearValues();
      }
    });
  }

  _deleteDrug(Drug drug) {
    _showProgress('Deleting Drug...');
    Services.deleteDrug(drug.id).then((result) {
      if ('success' == result) {
        _getDrugs(); // Refresh after delete...
      }
    });
  }

  // Method to clear TextField values
  _clearValues() {
    _drugNameController.text = '';
    _programmeNameController.text = '';
    // _batchNo.text = '';
    _expiryDate.text = '';
    _manufacturingDate.text = '';
    _availableQnty.text = '';
  }

  _showValues(Drug drug) {
    _drugNameController.text = drug.drugName;
    _programmeNameController.text = drug.programmeName;
    //_batchNo.text = drug.batchNo;
    _expiryDate.text = drug.expiryDate;
    _manufacturingDate.text = drug.packingDescription;
    _availableQnty.text = drug.availableQty;
  }

  // Let's create a DataTable and show the drug list in it.
  SingleChildScrollView _dataBody() {
    // Both Vertical and Horozontal Scrollview for the DataTable to
    // scroll both Vertical and Horizontal...
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(
              label: Text('ID'),
            ),
            DataColumn(
              label: Text('DRUG NAME'),
            ),
            DataColumn(
              label: Text('PROGRAMME NAME'),
            ),
            DataColumn(
              label: Text('BATCH NO'),
            ),
            DataColumn(
              label: Text('EXPIRY DATE'),
            ),
            DataColumn(
              label: Text('PACKING DESCRIPTION'),
            ),
            DataColumn(
              label: Text('AVAILABLE QNTY'),
            ),
            // Lets add one more column to show a delete button
            DataColumn(label: Text('DELETE')),
          ],

          // the list should show the filtered list now
          rows: _filterDrugs
              .map(
                (drug) => DataRow(cells: [
                  DataCell(
                    Text(drug.id),
                    // Add tap in the row and populate the
                    // textfields with the corresponding values to update
                    onTap: () {
                      _showValues(drug);
                      // Set the Selected drug to Update
                      _selectedDrug = drug;
                      setState(() {
                        _isUpdating = true;
                      });
                    },
                  ),
                  DataCell(
                    Text(
                      drug.drugName.toUpperCase(),
                    ),
                    onTap: () {
                      _showValues(drug);
                      // Set the Selected drug to Update
                      _selectedDrug = drug;
                      // Set flag updating to true to indicate in Update Mode
                      setState(() {
                        _isUpdating = true;
                      });
                    },
                  ),
                  DataCell(
                    Text(
                      drug.programmeName.toUpperCase(),
                    ),
                    onTap: () {
                      _showValues(drug);
                      // Set the Selected drug to Update
                      _selectedDrug = drug;
                      setState(() {
                        _isUpdating = true;
                      });
                    },
                  ),
                  DataCell(
                    Text(
                      drug.expiryDate.toUpperCase(),
                    ),
                    onTap: () {
                      _showValues(drug);
                      // Set the Selected drug to Update
                      _selectedDrug = drug;
                      setState(() {
                        _isUpdating = true;
                      });
                    },
                  ),
                  // DataCell(
                  //   Text(
                  //     drug.batchNo.toUpperCase(),
                  //   ),
                  //   onTap: () {
                  //     _showValues(drug);
                  //     // Set the Selected drug to Update
                  //     _selectedDrug = drug;
                  //     setState(() {
                  //       _isUpdating = true;
                  //     });
                  //   },
                  // ),
                  DataCell(
                    Text(
                      drug.packingDescription.toUpperCase(),
                    ),
                    onTap: () {
                      _showValues(drug);
                      // Set the Selected drug to Update
                      _selectedDrug = drug;
                      setState(() {
                        _isUpdating = true;
                      });
                    },
                  ),
                  DataCell(
                    Text(
                      drug.availableQty.toUpperCase(),
                    ),
                    onTap: () {
                      _showValues(drug);
                      // Set the Selected drug to Update
                      _selectedDrug = drug;
                      setState(() {
                        _isUpdating = true;
                      });
                    },
                  ),
                  DataCell(IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _deleteDrug(drug);
                    },
                  ))
                ]),
              )
              .toList(),
        ),
      ),
    );
  }

  // Let's add a searchfield to search in the DataTable.
  searchField() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(5.0),
          hintText: 'Filter by Drug name ',
        ),
        onChanged: (string) {
          // We will start filtering when the user types in the textfield.
          // Run the debouncer and start searching
          _debouncer.run(() {
            // Filter the original List and update the Filter list
            setState(() {
              _filterDrugs = _drugs
                  .where((u) => (u.drugName
                          .toLowerCase()
                          .contains(string.toLowerCase()) ||
                      u.programmeName
                          .toLowerCase()
                          .contains(string.toLowerCase())))
                  .toList();
            });
          });
        },
      ),
    );
  }

  //  let's update the model...

  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(_titleProgress), // we show the progress in the title...
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _createTable();
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _getDrugs();
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _drugNameController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Drug Name',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _programmeNameController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Programme Name',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _programmeNameController,
                decoration: InputDecoration.collapsed(
                  hintText: 'expiryDate',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _programmeNameController,
                decoration: InputDecoration.collapsed(
                  hintText: 'batchNo',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _programmeNameController,
                decoration: InputDecoration.collapsed(
                  hintText: 'manufacturingDate',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _programmeNameController,
                decoration: InputDecoration.collapsed(
                  hintText: 'availabileQnty',
                ),
              ),
            ),

            // Add an update button and a Cancel Button
            // show these buttons only when updating an drug
            _isUpdating
                ? Row(
                    children: <Widget>[
                      OutlineButton(
                        child: Text('UPDATE'),
                        onPressed: () {
                          _updateDrug(_selectedDrug);
                        },
                      ),
                      OutlineButton(
                        child: Text('CANCEL'),
                        onPressed: () {
                          setState(() {
                            _isUpdating = false;
                          });
                          _clearValues();
                        },
                      ),
                    ],
                  )
                : Container(),
            searchField(),
            Expanded(
              child: _dataBody(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addDrug();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
