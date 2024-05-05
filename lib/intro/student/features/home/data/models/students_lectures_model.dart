class StudentsLecturesModel {
  int? pk;
  String? name;
  InstructorInfo? instructorInfo;
  String? lectureHall;
  String? faculty;
  String? grade;
  String? lectureStartTime;
  String? lectureEndTime;

  StudentsLecturesModel(
      {this.pk,
      this.name,
      this.instructorInfo,
      this.lectureHall,
      this.faculty,
      this.grade,
      this.lectureStartTime,
      this.lectureEndTime});

  StudentsLecturesModel.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    name = json['name'];
    instructorInfo = json['instructor_info'] != null
        ? InstructorInfo.fromJson(json['instructor_info'])
        : null;
    lectureHall = json['lecture_hall'];
    faculty = json['faculty'];
    grade = json['grade'];
    lectureStartTime = json['lecture_start_time'];
    lectureEndTime = json['lecture_end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pk'] = pk;
    data['name'] = name;
    if (instructorInfo != null) {
      data['instructor_info'] = instructorInfo!.toJson();
    }
    data['lecture_hall'] = lectureHall;
    data['faculty'] = faculty;
    data['grade'] = grade;
    data['lecture_start_time'] = lectureStartTime;
    data['lecture_end_time'] = lectureEndTime;
    return data;
  }
}

class InstructorInfo {
  int? pk;
  String? name;

  InstructorInfo({this.pk, this.name});

  InstructorInfo.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pk'] = pk;
    data['name'] = name;
    return data;
  }
}
