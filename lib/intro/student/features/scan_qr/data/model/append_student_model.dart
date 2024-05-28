class AppendStudentModel {
  String message;

  AppendStudentModel({required this.message});

  factory AppendStudentModel.fromJson(Map<String, dynamic> json) {
    return AppendStudentModel(message: json["message"]);
  }
}
