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
      {this.availableQty,
      this.drugId,
      this.drugName,
      this.fromStoreId,
      this.fromStoreName,
      this.indentDate,
      this.indentId,
      this.indentRemarks,
      this.indentStatus,
      this.packingDescription,
      this.programmeId,
      this.programmeName,
      this.remarks,
      this.requestQty,
      this.stockId,
      this.strengthUnit,
      this.strengthValue,
      this.tax,
      this.toStoreId,
      this.toStoreName,
      this.unitPrice,
      this.updateValue});

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
