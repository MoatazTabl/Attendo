class SignInModel {
  String token;

  SignInModel({required this.token});

  factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
    return SignInModel(token: jsonData['jwt token']);
  }
}