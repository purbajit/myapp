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
      {this.s16193,
      this.s16197,
      this.s16201,
      this.s16203,
      this.s16206,
      this.s16209,
      this.s16238,
      this.s16239,
      this.s16240,
      this.s16241,
      this.s16242,
      this.s16243,
      this.s16244,
      this.s16246,
      this.s16247,
      this.s16248,
      this.s16249,
      this.s16250});

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
