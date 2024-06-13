import 'dart:async';

import 'package:attendo/intro/student/features/scan_qr/data/model/qr_model.dart';
import 'package:attendo/intro/student/features/scan_qr/logic/qr_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'widgets/scanner_error_widget.dart';

class ScanQr extends StatefulWidget {
  const ScanQr({super.key, required this.qrModel});

  final QrModel qrModel;

  @override
  State<ScanQr> createState() => _ScanQrState();
}

class _ScanQrState extends State<ScanQr> with WidgetsBindingObserver {
  final MobileScannerController controller = MobileScannerController(
    formats: [BarcodeFormat.qrCode],
    useNewCameraSelector: true,
    facing: CameraFacing.back,
    autoStart: false,
    detectionSpeed: DetectionSpeed.normal,
    detectionTimeoutMs: 1000,
    returnImage: false,
  );

  Barcode? _barcode;
  StreamSubscription<Object?>? _subscription;
  late Future<String> lectureCode;

  void _handleBarcode(BarcodeCapture barcodes) {
    if (mounted) {
      setState(() {
        _barcode = barcodes.barcodes.firstOrNull;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _subscription = controller.barcodes.listen(_handleBarcode);

    lectureCode = context.read<QrCubit>().getCode(widget.qrModel.lectureId);
    unawaited(controller.start());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!controller.value.isInitialized) {
      return;
    }

    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        return;
      case AppLifecycleState.resumed:
        _subscription = controller.barcodes.listen(_handleBarcode);

        unawaited(controller.start());
      case AppLifecycleState.inactive:
        unawaited(_subscription?.cancel());
        _subscription = null;
        unawaited(controller.stop());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'With controller',
        ),
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
            onDetect: (barcodes) async {
              String? scannedQr = barcodes.barcodes.first.rawValue;
              if (scannedQr == await lectureCode) {
                context.read<QrCubit>().appendStudent(
                    widget.qrModel.lectureId, widget.qrModel.studentName);
                context.pop();
              }
            },
            errorBuilder: (context, error, child) {
              return ScannerErrorWidget(error: error);
            },
            fit: BoxFit.contain,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 100,
              color: Colors.black.withOpacity(0.4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Center(
                      child: BuildBarCode(
                        barcode: _barcode,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Future<void> dispose() async {
    WidgetsBinding.instance.removeObserver(this);
    unawaited(_subscription?.cancel());
    _subscription = null;
    super.dispose();
    await controller.dispose();
  }
}

class BuildBarCode extends StatelessWidget {
  const BuildBarCode({super.key, required this.barcode});

  final Barcode? barcode;

  @override
  Widget build(BuildContext context) {
    if (barcode == null) {
      return const Text(
        'Scan something!',
        overflow: TextOverflow.fade,
        style: TextStyle(color: Colors.white),
      );
    }

    return Text(
      barcode?.displayValue ?? 'No display value.',
      overflow: TextOverflow.fade,
      style: const TextStyle(color: Colors.white),
    );
  }
}
