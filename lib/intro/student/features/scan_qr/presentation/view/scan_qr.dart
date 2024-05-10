import 'package:attendo/core/networking/api_service.dart';
import 'package:attendo/core/networking/api_strings.dart';
import 'package:attendo/intro/auth/models/sign_in_model.dart';
import 'package:attendo/intro/student/features/scan_qr/presentation/view/view_model/models/get_qr_code_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrCodeFunctions {
  static scan(BuildContext context, String lectureCode) async {
    try {
      String generatedCode = await FlutterBarcodeScanner.scanBarcode(
          "#2A99CF", "Cancel", true, ScanMode.QR);
      print("Scanned Successfully, the code is $generatedCode");
      if (generatedCode == lectureCode) {
        _showDialog(context, "Correct! You scanned the right QR code.");
      } else {
        _showDialog(context, "Wrong! This is not the correct QR code.");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static void _showDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("QR Code Scan Result"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  getLectureCode(int lectureId) async {
    final response = await ApiService()
        .post(endpoint: ApiStrings.getLatestCode, data: {"pk": lectureId});
    final lectureCode = GetQrCodeModel.fromJson(response);
    return lectureCode.qrCode;
  }

  appendStudent(int lectureId,String studentName) async {
    try {
      final response =
          await ApiService().post(endpoint: ApiStrings.appendStudent, data: {
            "lecturepk": lectureId,
            "studentname": studentName
          });
    } catch (e) {
      print(e.toString());
    }
  }
}
