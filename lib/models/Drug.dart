class Drug {
  List<Null> columns;
  List<Null> data;
  List<DrugList> drugList;
  Null drugListStockEntry;
  Null loggedIn;
  ProgramList programList;
  Null session;
  String stockList;

  Drug(
      {List<Null> columns,
      List<Null> data,
      List<DrugList> drugList,
      Null drugListStockEntry,
      Null loggedIn,
      ProgramList programList,
      Null session,
      String stockList}) {
    this.columns = columns;
    this.data = data;
    this.drugList = drugList;
    this.drugListStockEntry = drugListStockEntry;
    this.loggedIn = loggedIn;
    this.programList = programList;
    this.session = session;
    this.stockList = stockList;
  }

  Drug.fromJson(Map<String, dynamic> json) {
    // if (json['columns'] != null) {
    //   columns = new List<Null>();
    //   json['columns'].forEach((v) {
    //     columns.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['data'] != null) {
    //   data = new List<Null>();
    //   json['data'].forEach((v) {
    //     data.add(new Null.fromJson(v));
    //   });
    // }
    if (json['drugList'] != null) {
      drugList = new List<DrugList>();
      json['drugList'].forEach((v) {
        drugList.add(new DrugList.fromJson(v));
      });
    }
    drugListStockEntry = json['drugListStockEntry'];
    loggedIn = json['loggedIn'];
    programList = json['programList'] != null
        ? new ProgramList.fromJson(json['programList'])
        : null;
    session = json['session'];
    stockList = json['stockList'];
  }

  String get drugName => drugName;

  String get programmeName => programmeName;

  String get expiryDate => expiryDate;

  String get batchNo => null;

  String get packingDescription => packingDescription;

  String get availableQty => null;

  String get id => drugId;

  get drugId => drugId;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // if (this.columns != null) {
    //   data['columns'] = this.columns.map((v) => v.toJson()).toList();
    // }
    // if (this.data != null) {
    //   data['data'] = this.data.map((v) => v.toJson()).toList();
    // }
    if (this.drugList != null) {
      data['drugList'] = this.drugList.map((v) => v.toJson()).toList();
    }
    data['drugListStockEntry'] = this.drugListStockEntry;
    data['loggedIn'] = this.loggedIn;
    if (this.programList != null) {
      data['programList'] = this.programList.toJson();
    }
    data['session'] = this.session;
    data['stockList'] = this.stockList;
    return data;
  }
}

class DrugList {
  int availableQty;
  String drugId;
  String drugName;
  Null fromStoreId;
  Null fromStoreName;
  Null indentDate;
  Null indentId;
  Null indentRemarks;
  Null indentStatus;
  String packingDescription;
  String programmeId;
  String programmeName;
  Null remarks;
  Null requestQty;
  Null stockId;
  Null strengthUnit;
  Null strengthValue;
  Null tax;
  Null toStoreId;
  Null toStoreName;
  Null unitPrice;
  Null updateValue;

  DrugList(
      {int availableQty,
      String drugId,
      String drugName,
      Null fromStoreId,
      Null fromStoreName,
      Null indentDate,
      Null indentId,
      Null indentRemarks,
      Null indentStatus,
      String packingDescription,
      String programmeId,
      String programmeName,
      Null remarks,
      Null requestQty,
      Null stockId,
      Null strengthUnit,
      Null strengthValue,
      Null tax,
      Null toStoreId,
      Null toStoreName,
      Null unitPrice,
      Null updateValue}) {
    this.availableQty = availableQty;
    this.drugId = drugId;
    this.drugName = drugName;
    this.fromStoreId = fromStoreId;
    this.fromStoreName = fromStoreName;
    this.indentDate = indentDate;
    this.indentId = indentId;
    this.indentRemarks = indentRemarks;
    this.indentStatus = indentStatus;
    this.packingDescription = packingDescription;
    this.programmeId = programmeId;
    this.programmeName = programmeName;
    this.remarks = remarks;
    this.requestQty = requestQty;
    this.stockId = stockId;
    this.strengthUnit = strengthUnit;
    this.strengthValue = strengthValue;
    this.tax = tax;
    this.toStoreId = toStoreId;
    this.toStoreName = toStoreName;
    this.unitPrice = unitPrice;
    this.updateValue = updateValue;
  }

  DrugList.fromJson(Map<String, dynamic> json) {
    availableQty = json['available_qty'];
    drugId = json['drug_id'];
    drugName = json['drug_name'];
    fromStoreId = json['fromStore_id'];
    fromStoreName = json['fromStore_name'];
    indentDate = json['indent_date'];
    indentId = json['indent_id'];
    indentRemarks = json['indent_remarks'];
    indentStatus = json['indent_status'];
    packingDescription = json['packing_description'];
    programmeId = json['programme_id'];
    programmeName = json['programme_name'];
    remarks = json['remarks'];
    requestQty = json['request_qty'];
    stockId = json['stock_id'];
    strengthUnit = json['strength_unit'];
    strengthValue = json['strength_value'];
    tax = json['tax'];
    toStoreId = json['toStore_id'];
    toStoreName = json['toStore_name'];
    unitPrice = json['unit_price'];
    updateValue = json['update_value'];
  }
  String get id => drugId;

  // String get drugName => drugName;

  // String get programmeName => null;

  // String get batchNo => null;

  // String get expiryDate => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['available_qty'] = this.availableQty;
    data['drug_id'] = this.drugId;
    data['drug_name'] = this.drugName;
    data['fromStore_id'] = this.fromStoreId;
    data['fromStore_name'] = this.fromStoreName;
    data['indent_date'] = this.indentDate;
    data['indent_id'] = this.indentId;
    data['indent_remarks'] = this.indentRemarks;
    data['indent_status'] = this.indentStatus;
    data['packing_description'] = this.packingDescription;
    data['programme_id'] = this.programmeId;
    data['programme_name'] = this.programmeName;
    data['remarks'] = this.remarks;
    data['request_qty'] = this.requestQty;
    data['stock_id'] = this.stockId;
    data['strength_unit'] = this.strengthUnit;
    data['strength_value'] = this.strengthValue;
    data['tax'] = this.tax;
    data['toStore_id'] = this.toStoreId;
    data['toStore_name'] = this.toStoreName;
    data['unit_price'] = this.unitPrice;
    data['update_value'] = this.updateValue;
    return data;
  }
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

  ProgramList(
      {String s16193,
      String s16197,
      String s16201,
      String s16203,
      String s16206,
      String s16209,
      String s16238,
      String s16239,
      String s16240,
      String s16241,
      String s16242,
      String s16243,
      String s16244,
      String s16246,
      String s16247,
      String s16248,
      String s16249,
      String s16250}) {
    this.s16193 = s16193;
    this.s16197 = s16197;
    this.s16201 = s16201;
    this.s16203 = s16203;
    this.s16206 = s16206;
    this.s16209 = s16209;
    this.s16238 = s16238;
    this.s16239 = s16239;
    this.s16240 = s16240;
    this.s16241 = s16241;
    this.s16242 = s16242;
    this.s16243 = s16243;
    this.s16244 = s16244;
    this.s16246 = s16246;
    this.s16247 = s16247;
    this.s16248 = s16248;
    this.s16249 = s16249;
    this.s16250 = s16250;
  }

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['16193'] = this.s16193;
    data['16197'] = this.s16197;
    data['16201'] = this.s16201;
    data['16203'] = this.s16203;
    data['16206'] = this.s16206;
    data['16209'] = this.s16209;
    data['16238'] = this.s16238;
    data['16239'] = this.s16239;
    data['16240'] = this.s16240;
    data['16241'] = this.s16241;
    data['16242'] = this.s16242;
    data['16243'] = this.s16243;
    data['16244'] = this.s16244;
    data['16246'] = this.s16246;
    data['16247'] = this.s16247;
    data['16248'] = this.s16248;
    data['16249'] = this.s16249;
    data['16250'] = this.s16250;
    return data;
  }
}
