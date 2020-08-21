class Drug {
  String columns;
  String data;
  List<DrugList> drugList;
  List<ProgramList> programList;

  Drug.fromJson(Map<String, dynamic> json) {
    columns = json['columns'];
    data = json['data'];
    if (json['drugList'] != null) {
      drugList = new List<DrugList>();
      json['drugList'].forEach((v) {
        drugList.add(new DrugList.fromJson(v));
      });
    }
    if (json[' programList'] != null) {
      programList = new List<ProgramList>();
      json[' programList'].forEach((v) {
        programList.add(new ProgramList.fromJson(v));
      });
    }
  }
  // String get drugName => drugName;

  // String get programmeName => programmeName;

  // String get expiryDate => expiryDate;
  // String get packingDescription => packingDescription;

  // String get availableQty => availableQty;
  // String get id => drugId;

  // get drugId => drugId;
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['columns'] = columns;
  //   data['data'] = data;

  //   if (drugList != null) {
  //     data['drugList'] = drugList.map((v) => v.toJson()).toList();
  //   }
  //   if (drugList != null) {
  //     data['programList'] = drugList.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class DrugList {
  String drugId;
  String drugName;
  String programmeId;
  String programmeName;
  String expiryDate;
  String packingDescription;
  String availableQty;
  // bool verified;

  DrugList.fromJson(Map<String, dynamic> json) {
    drugId = json['drug_id'];
    drugName = json['drug_name'];
    programmeId = json['programme_id'];
    programmeName = json['programme_name'];
    expiryDate = json['expiry_date'];
    packingDescription = json['packingDescription'];
    availableQty = json['available_qty'];
    // verified = json['verified'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['available_qty'] = availableQty;
  //   data['drug_id'] = drugId;
  //   data['drug_name'] = drugName;
  //   data['packing_description'] = packingDescription;
  //   data['programme_id'] = programmeId;
  //   data['programme_name'] = programmeName;
  //   return data;
  // }
}

class ProgramList {
  String s16193;
  String s16197;
  String s16201;
  String s16203;
  String s16206;
  String s16209;
  String s16238;
  String s16239;
  String s16240;
  String s16241;
  String s16242;
  String s16243;
  String s16244;
  String s16246;
  String s16247;
  String s16248;
  String s16249;
  String s16250;

  ProgramList.fromJson(Map<String, dynamic> json) {
    s16193 = json['16193'];
    s16197 = json['16197'];
    s16201 = json['16201'];
    s16203 = json['16203'];
    s16206 = json['16206'];
    s16209 = json['16209'];
    s16238 = json['16238'];
    s16239 = json['16239'];
    s16240 = json['16240'];
    s16241 = json['16241'];
    s16242 = json['16242'];
    s16243 = json['16243'];
    s16244 = json['16244'];
    s16246 = json['16246'];
    s16247 = json['16247'];
    s16248 = json['16248'];
    s16249 = json['16249'];
    s16250 = json['16250'];
  }
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['programme_id'] = programmeId;
  //   data['programme_name'] = programmeName;
  //   return data;
  // }
}
