import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrCodeFunctions {
  static scan(BuildContext context,String lectureCode) async {
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



}