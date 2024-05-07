class ReportMessageModel {
  String message;

  ReportMessageModel({required this.message});

  factory ReportMessageModel.fromJson(Map<String, dynamic> json) {
    return ReportMessageModel(message: json['message']);
  }
}
