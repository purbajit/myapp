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
  String programmeId;
  String programmeName;

  ProgramList.fromJson(Map<String, dynamic> json) {
    programmeId = json['programme_id'];
    programmeName = json['programme_name'];
  }
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['programme_id'] = programmeId;
  //   data['programme_name'] = programmeName;
  //   return data;
  // }
}
