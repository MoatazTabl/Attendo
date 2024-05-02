class UserDataModel
{
  String name;
  String email;
  String nationalId;
  String? faculty;
  String? grade;

  UserDataModel({required this.name,
    required this.email,
    required this.nationalId,
     this.faculty,
     this.grade});

  // factory UserDataModel.fromJson(Map<String, dynamic>json)
  // {
  //   return UserDataModel(name: name, email: email, nationalId: nationalId);
  // }



}


///"name": "aaaa",
///        "email": "mosetafa@stu.com",
///        "password": "computer",
///       "national_id": "30208061204533",
///        "faculty": "computer",
///        "grade": "third"