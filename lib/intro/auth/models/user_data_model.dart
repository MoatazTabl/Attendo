class UserDataModel {
  int userId;
  String name;
  String nationalId;
  String? faculty;
  String? grade;

  UserDataModel(
      {required this.userId,
      required this.name,
      required this.nationalId,
      this.faculty,
      this.grade});

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
        userId: json["user_id"],
        name: json["name"],
        nationalId: json["national_id"],
        faculty: json["faculty"],
        grade: json["grade"]);
  }
}
