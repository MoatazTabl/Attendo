import 'package:attendo/core/app_images.dart';
import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/intro/student/features/scan_qr/presentation/view/scan_qr.dart';
import 'package:attendo/intro/student/features/scan_qr/presentation/view/widgets/scan_window.dart';
import 'package:attendo/intro/student/features/scan_qr/presentation/view/widgets/scanner_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  void showCustomFailedDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: SizedBox(height: 90,
              child: Image.asset(
                AppImages.failureState,
              )),
          content: Text(message),
          title: Text(
            getAppLocalizations(context)!.failed,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0XFFD64556),
          actions: <Widget>[
            Center(
              child: TextButton(
                child: Text(
                  getAppLocalizations(context)!.ok,
                  style: const TextStyle(color: Colors.white),
                ),
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

  void showCustomSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: SizedBox(
            height: 90,
            child: Image.asset(
              AppImages.successState,
            ),
          ),
          title: Text(
            getAppLocalizations(context)!.success,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0XFF74CE68),
          actions: <Widget>[
            Center(
              child: TextButton(
                child: Text(
                  getAppLocalizations(context)!.ok,
                  style: const TextStyle(color: Colors.white),
                ),
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

    return BlocListener<QrCubit, QrState>(
      listener: (context, state) {
        if (state is QrSuccess) {
          showCustomSuccessDialog(context);
        } else if (state is QrError) {
          showCustomFailedDialog(context, state.errorMessage);
        }
      },
      child: Stack(
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
                if (_isProcessing) return; // Prevent multiple detections
                setState(() {
                  _isProcessing = true;
                });
                String? scannedQr = barcodes.barcodes.first.rawValue;
                late Future<String> lectureCode;
                lectureCode = context
                    .read<QrCubit>()
                    .getCode(widget.scanQrModel.qrModel.lectureId);

                if (scannedQr == await lectureCode && context.mounted) {
                  context.read<QrCubit>().appendStudent(
                      widget.scanQrModel.qrModel.lectureId,
                      widget.scanQrModel.qrModel.studentName);
                } else {
                  showCustomFailedDialog(
                      context, getAppLocalizations(context)!.qrFailure);
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
      ),
    );
  }
}
