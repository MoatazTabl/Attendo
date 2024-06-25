class GetReportsModel {
  List<Result>? result;

  GetReportsModel({this.result});

  GetReportsModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  int? pk;
  int? lecturePk;
  String? lectureName;
  List<StudentsList>? studentsList;
  String? date;
  List<String>? authorizationTime;
  num? totalStudents;
  num? attendingStudents;
  num? absentStudents;
  num? attendancePercentage;

  Result(
      {this.pk,
      this.lecturePk,
      this.lectureName,
      this.studentsList,
      this.date,
      this.authorizationTime,
      this.totalStudents,
      this.attendingStudents,
      this.absentStudents,
      this.attendancePercentage});

  Result.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    lecturePk = json['lecture_pk'];
    lectureName = json['lecture_name'];
    if (json['students_list'] != null) {
      studentsList = <StudentsList>[];
      json['students_list'].forEach((v) {
        studentsList!.add(StudentsList.fromJson(v));
      });
    }
    date = json['date'];
    authorizationTime = json['authorization_time'].cast<String>();
    totalStudents = json['total_students'];
    attendingStudents = json['attending_students'];
    absentStudents = json['absent_students'];
    attendancePercentage = json['attendance_percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pk'] = pk;
    data['lecture_pk'] = lecturePk;
    data['lecture_name'] = lectureName;
    if (studentsList != null) {
      data['students_list'] = studentsList!.map((v) => v.toJson()).toList();
    }
    data['date'] = date;
    data['authorization_time'] = authorizationTime;
    data['total_students'] = totalStudents;
    data['attending_students'] = attendingStudents;
    data['absent_students'] = absentStudents;
    data['attendance_percentage'] = attendancePercentage;
    return data;
  }
}

class StudentsList {
  int? userId;
  String? name;
  String? photo;
  String? nationalId;

  StudentsList({this.userId, this.name, this.photo, this.nationalId});

  StudentsList.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    photo = json['photo'];
    nationalId = json['national_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['name'] = name;
    data['photo'] = photo;
    data['national_id'] = nationalId;
    return data;
  }
}
