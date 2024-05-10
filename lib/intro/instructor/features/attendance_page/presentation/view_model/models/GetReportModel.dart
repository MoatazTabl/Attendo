/// lecture_pk : 56
/// lecture_name : "uii"
/// students_list : [{"user_id":60,"name":"Moaz Omran20","national_id":"302021011"}]
/// date : "2024-05-10"
/// authorization_time : ["20:18:54"]

class GetReportModel {
  GetReportModel({
      this.lecturePk, 
      this.lectureName, 
      this.studentsList, 
      this.date, 
      this.authorizationTime,});

  GetReportModel.fromJson(dynamic json) {
    lecturePk = json['lecture_pk'];
    lectureName = json['lecture_name'];
    if (json['students_list'] != null) {
      studentsList = [];
      json['students_list'].forEach((v) {
        studentsList?.add(StudentsList.fromJson(v));
      });
    }
    date = json['date'];
    authorizationTime = json['authorization_time'] != null ? json['authorization_time'].cast<String>() : [];
  }
  num? lecturePk;
  String? lectureName;
  List<StudentsList>? studentsList;
  String? date;
  List<String>? authorizationTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lecture_pk'] = lecturePk;
    map['lecture_name'] = lectureName;
    if (studentsList != null) {
      map['students_list'] = studentsList?.map((v) => v.toJson()).toList();
    }
    map['date'] = date;
    map['authorization_time'] = authorizationTime;
    return map;
  }

}

/// user_id : 60
/// name : "Moaz Omran20"
/// national_id : "302021011"

class StudentsList {
  StudentsList({
      this.userId, 
      this.name, 
      this.nationalId,});

  StudentsList.fromJson(dynamic json) {
    userId = json['user_id'];
    name = json['name'];
    nationalId = json['national_id'];
  }
  num? userId;
  String? name;
  String? nationalId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['name'] = name;
    map['national_id'] = nationalId;
    return map;
  }

}