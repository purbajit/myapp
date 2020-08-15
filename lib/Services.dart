import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:guist/models/Drug.dart';

class Services {
  static const ROOT =
      "http://196.1.113.93/dvdms/getStockList?userID=$userId&pageno=$pageNo";
  static const _CREATE_TABLE_ACTION = 'CREATE_TABLE';
  static const _GET_ALL_ACTION = 'GET_ALL';
  static const _ADD_DRUG_ACTION = 'ADD_DRUG';
  static const _UPDATE_DRUG_ACTION = 'UPDATE_DRUG';
  static const _DELETE_DRUG_ACTION = 'DELETE_DRUG';

  // Method to create the table Drugs.
  static Future<String> createTable() async {
    try {
      // add the parameters to pass to the request.
      var map = Map<String, dynamic>();
      map['action'] = _CREATE_TABLE_ACTION;
      final response = await http.post(ROOT, body: map);
      print('Create Table Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  static Future<List<Drug>> getDrugs() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_ACTION;
      final response = await http.post(ROOT, body: map);
      print('getDrugs Response: ${response.body}');
      if (200 == response.statusCode) {
        List<Drug> list = parseResponse(response.body);
        return list;
      } else {
        return List<Drug>();
      }
    } catch (e) {
      return List<Drug>(); // return an empty list on exception/error
    }
  }

  static List<Drug> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Drug>((json) => Drug.fromJson(json)).toList();
  }

  // Method to add Drug to the database...
  static Future<String> addDrug(
      String drugName,
      String programmeName,
      String batchNo,
      String expiryDate,
      String manufacturingDate,
      String availableQnty) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _ADD_DRUG_ACTION;
      map['drug_name'] = drugName;
      map['Programme_name'] = programmeName;
      map['Batch_No'] = batchNo;
      map['ExpiryDate'] = expiryDate;
      map['ManufacturingDate'] = manufacturingDate;
      map['AvailabilityQnty'] = availableQnty;
      final response = await http.post(ROOT, body: map);
      print('addDrug Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  // Method to update an Drug in Database...
  static Future<String> updateDrug(
      String drugid,
      String drugName,
      String programmeName,
      String batchNo,
      String expiryDate,
      String manufacturingDate,
      String availableQnty) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _UPDATE_DRUG_ACTION;
      map['drug_id'] = drugid;
      map['drug_name'] = drugName;
      map['Programme_name'] = programmeName;
      map['Batch_No'] = batchNo;
      map['ExpiryDate'] = expiryDate;
      map['ManufacturingDate'] = manufacturingDate;
      map['AvailabilityQnty'] = availableQnty;

      final response = await http.post(ROOT, body: map);
      print('updateDrug Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  // Method to Delete an Drug from Database...
  static Future<String> deleteDrug(String drugid) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _DELETE_DRUG_ACTION;
      map['drug_id'] = drugid;
      final response = await http.post(ROOT, body: map);
      print('deleteDrug Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error"; // returning just an "error" string to keep this simple...
    }
  }
}
