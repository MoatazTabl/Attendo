import 'package:attendo/core/widgets/custom_snack_bar.dart';
import 'package:attendo/intro/student/features/scan_qr/presentation/view/scan_qr.dart';
import 'package:attendo/intro/student/features/scan_qr/presentation/view/widgets/scan_window.dart';
import 'package:attendo/intro/student/features/scan_qr/presentation/view/widgets/scanner_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../logic/qr_cubit.dart';

class MobileScannerWidget extends StatelessWidget {
  const MobileScannerWidget({
    super.key,
    required this.controller,
    required this.scanQrModel,
  });

  final MobileScannerController controller;
  final ScanQr scanQrModel;

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
            controller: controller,
            scanWindow: scanWindow,
            errorBuilder: (context, error, child) {
              return ScannerErrorWidget(error: error);
            },
            onDetect: (barcodes) async {
              String? scannedQr = barcodes.barcodes.first.rawValue;
              late Future<String> lectureCode;
              lectureCode = context.read<QrCubit>().getCode(
                  scanQrModel.qrModel.lectureId);

              if (scannedQr == await lectureCode) {
                context.read<QrCubit>().appendStudent(
                    scanQrModel.qrModel.lectureId,
                    scanQrModel.qrModel.studentName);
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
          valueListenable: controller,
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
