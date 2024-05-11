import '../../../../home/data/models/instructor_lectures_model.dart';

class InstructorDetailsReportModel {
  InstructorLecturesModel instructorLecturesModel;
  String date;

  InstructorDetailsReportModel(
      {required this.instructorLecturesModel, required this.date});
}
