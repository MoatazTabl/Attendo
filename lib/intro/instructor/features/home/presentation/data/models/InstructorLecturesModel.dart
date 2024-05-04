class InstructorLecturesModel {
  InstructorLecturesModel({
    this.pk,
    this.name,
    this.instructorInfo,
    this.lectureHall,
    this.faculty,
    this.grade,
    this.lectureStartTime,
    this.lectureEndTime,
     });

  InstructorLecturesModel.fromJson(dynamic json) {
    pk = json['pk'];
    name = json['name'];
    instructorInfo = json['instructor_info'] != null ? InstructorInfo.fromJson(json['instructor_info']) : null;
    lectureHall = json['lecture_hall'];
    faculty = json['faculty'];
    grade = json['grade'];
    lectureStartTime = json['lecture_start_time'];
    lectureEndTime = json['lecture_end_time'];
  }
  int? pk;
  String? name;
  InstructorInfo? instructorInfo;
  String? lectureHall;
  String? faculty;
  String? grade;
  String? lectureStartTime;
  String? lectureEndTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pk'] = pk;
    map['name'] = name;
    if (instructorInfo != null) {
      map['instructor_info'] = instructorInfo?.toJson();
    }
    map['lecture_hall'] = lectureHall;
    map['faculty'] = faculty;
    map['grade'] = grade;
    map['lecture_start_time'] = lectureStartTime;
    map['lecture_end_time'] = lectureEndTime;
    return map;
  }

}


class InstructorInfo {
  InstructorInfo({
      this.pk, 
      this.name,});

  InstructorInfo.fromJson(dynamic json) {
    pk = json['pk'];
    name = json['name'];
  }
  int? pk;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pk'] = pk;
    map['name'] = name;
    return map;
  }

}