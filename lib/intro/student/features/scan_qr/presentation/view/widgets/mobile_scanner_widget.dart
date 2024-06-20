import 'package:attendo/core/widgets/custom_snack_bar.dart';
import 'package:attendo/intro/student/features/scan_qr/presentation/view/scan_qr.dart';
import 'package:attendo/intro/student/features/scan_qr/presentation/view/widgets/scan_window.dart';
import 'package:attendo/intro/student/features/scan_qr/presentation/view/widgets/scanner_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../logic/qr_cubit.dart';

class MobileScannerWidget extends StatefulWidget {
  const MobileScannerWidget({
    super.key,
    required this.controller,
    required this.scanQrModel,
  });

  final MobileScannerController controller;
  final ScanQr scanQrModel;

  @override
  State<MobileScannerWidget> createState() => _MobileScannerWidgetState();
}

class _MobileScannerWidgetState extends State<MobileScannerWidget> {
  bool _isProcessing = false;

  void showCustomDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: Container(height: 90,child: Image.asset("assets/images/failed.png",fit: BoxFit.fill,)),
          content: Text(message),
          title:  Text("Failed",style: TextStyle(color: Colors.white),),
          backgroundColor: Color(0XFFD64556),
          actions: <Widget>[
            Center(
              child: TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    _isProcessing = false; // Allow processing again
                  });
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.sizeOf(context).center(Offset.zero),
      width: 200,
      height: 200,
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        Center(
          child: MobileScanner(
            fit: BoxFit.fill,
            controller: widget.controller,
            scanWindow: scanWindow,
            errorBuilder: (context, error, child) {
              return ScannerErrorWidget(error: error);
            },
            onDetect: (barcodes) async {
              String? scannedQr = barcodes.barcodes.first.rawValue;
              late Future<String> lectureCode;
              lectureCode = context.read<QrCubit>().getCode(
                  widget.scanQrModel.qrModel.lectureId);

              if (scannedQr == await lectureCode) {
                context.read<QrCubit>().appendStudent(
                    widget.scanQrModel.qrModel.lectureId,
                    widget.scanQrModel.qrModel.studentName);
                GlobalSnackBar.show(
                    context, "Attendance has been taken successfully");
                context.pop();
              }
              if (scannedQr != await lectureCode) {
                GlobalSnackBar.show(
                    context, "Qr code is not correct");
                context.pop();
              }
            },
          ),
        ),
        ValueListenableBuilder(
          valueListenable: widget.controller,
          builder: (context, value, child) {
            if (!value.isInitialized ||
                !value.isRunning ||
                value.error != null) {
              return const SizedBox();
            }

            return CustomPaint(
              painter: ScannerOverlay(scanWindow: scanWindow),
            );
          },
        ),
      ],
    );
  }
}
