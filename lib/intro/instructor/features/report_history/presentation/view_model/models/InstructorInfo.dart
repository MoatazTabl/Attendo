class InstructorInfo {
  InstructorInfo({
      this.pk, 
      this.name,});

  InstructorInfo.fromJson(dynamic json) {
    pk = json['pk'];
    name = json['name'];
  }
  int pk;
  String name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pk'] = pk;
    map['name'] = name;
    return map;
  }

}