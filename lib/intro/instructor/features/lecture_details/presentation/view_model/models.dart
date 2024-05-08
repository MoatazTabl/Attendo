import 'package:attendo/core/networking/api_strings.dart';

class QrCodeModel {
  String qr;

  QrCodeModel({required this.qr});

  factory QrCodeModel.fromJson(Map<String, dynamic> json) {
    return QrCodeModel(qr: json[ApiStrings.qrCode]);
  }
}
