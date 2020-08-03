class Drug {
  String id;
  String drugName;
  String programmeName;
  String batchNo;
  String expiryDate;
  String manufacturingDate;
  String availableQnty;

  Drug({this.id, this.drugName,  this.programmeName, this.batchNo, this.expiryDate, this.manufacturingDate, this.availableQnty});

  factory Drug.fromJson(Map<String, dynamic> json) {
    return Drug(
      id: json['id'] as String,
      drugName: json['drug_name'] as String,
      programmeName: json['Programme_name'] as String,
      batchNo: json['Batch No'] as String,
      expiryDate: json['ExpiryDate'] as String,
      manufacturingDate: json['ManufacturingDate'] as String,
      availableQnty: json['AvailableQnty'] as String,
      
    );
  }
}
