class AllStudentsModel {
  AllStudentsModel({
      this.pk, 
      this.name, 
      this.email, 
      this.photo, 
      this.nationalId, 
      this.deviceId, 
      this.faculty, 
      this.grade,});

  AllStudentsModel.fromJson(dynamic json) {
    pk = json['pk'];
    name = json['name'];
    email = json['email'];
    photo = json['photo'];
    nationalId = json['national_id'];
    deviceId = json['device_id'];
    faculty = json['faculty'];
    grade = json['grade'];
  }
  int pk;
  String name;
  String email;
  String photo;
  String nationalId;
  String deviceId;
  String faculty;
  String grade;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pk'] = pk;
    map['name'] = name;
    map['email'] = email;
    map['photo'] = photo;
    map['national_id'] = nationalId;
    map['device_id'] = deviceId;
    map['faculty'] = faculty;
    map['grade'] = grade;
    return map;
  }

}