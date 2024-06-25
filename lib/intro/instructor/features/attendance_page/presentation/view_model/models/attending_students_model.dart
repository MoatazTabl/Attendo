class AttendingAnalyticsModel {
  int? attendingStudents;
  int? absentStudents;
  int? attendancePercentage;

  AttendingAnalyticsModel(
      {this.attendingStudents, this.absentStudents, this.attendancePercentage});

  AttendingAnalyticsModel.fromJson(Map<String, dynamic> json) {
    attendingStudents = json['attending_students'];
    absentStudents = json['absent_students'];
    attendancePercentage = json['attendance_percentage'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals, unnecessary_new
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attending_students'] = attendingStudents;
    data['absent_students'] = absentStudents;
    data['attendance_percentage'] = attendancePercentage;
    return data;
  }
}
