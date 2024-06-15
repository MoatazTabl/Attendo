class GetQrCodeModel {
  String qrCode;

  GetQrCodeModel({required this.qrCode});

  factory GetQrCodeModel.fromJson(Map<String, dynamic> json) {
    return GetQrCodeModel(qrCode: json["QR_code"]);
  }
}
