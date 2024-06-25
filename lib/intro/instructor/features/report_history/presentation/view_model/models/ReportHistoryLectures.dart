import 'InstructorInfo.dart';

class ReportHistoryLectures {
  ReportHistoryLectures({
      this.pk, 
      this.name, 
      this.instructorInfo, 
      this.lectureHall, 
      this.faculty, 
      this.grade, 
      this.lectureStartTime, 
      this.lectureEndTime, 
      this.students,});

  ReportHistoryLectures.fromJson(dynamic json) {
    pk = json['pk'];
    name = json['name'];
    instructorInfo = json['instructor_info'] != null ? InstructorInfo.fromJson(json['instructor_info']) : null;
    lectureHall = json['lecture_hall'];
    faculty = json['faculty'];
    grade = json['grade'];
    lectureStartTime = json['lecture_start_time'];
    lectureEndTime = json['lecture_end_time'];
    students = json['students'];
  }
  int? pk;
  String? name;
  InstructorInfo? instructorInfo;
  String? lectureHall;
  String? faculty;
  String? grade;
  String? lectureStartTime;
  String? lectureEndTime;
  int? students;


}