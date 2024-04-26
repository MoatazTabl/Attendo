// import 'dart:async';
//
// import 'package:attendo/intro/student/features/scan_qr/presentation/view/widgets/scanner_error_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
//
// class ScanQrScreen extends StatefulWidget {
//   const ScanQrScreen({super.key});
//
//   @override
//   State<ScanQrScreen> createState() => _ScanQrScreenState();
// }
//
// class _ScanQrScreenState extends State<ScanQrScreen>
//     with WidgetsBindingObserver {
//   final MobileScannerController controller = MobileScannerController(
//     torchEnabled: true, useNewCameraSelector: true,
//     // formats: [BarcodeFormat.qrCode]
//     // facing: CameraFacing.front,
//     // detectionSpeed: DetectionSpeed.normal
//     // detectionTimeoutMs: 1000,
//     // returnImage: false,
//   );
//
//   Barcode? _barcode;
//   StreamSubscription<Object?>? _subscription;
//
//   Widget _buildBarcode(Barcode? value) {
//     if (value == null) {
//       return const Text(
//         'Scan something!',
//         overflow: TextOverflow.fade,
//         style: TextStyle(color: Colors.white),
//       );
//     }
//
//     return Text(
//       value.displayValue ?? 'No display value.',
//       overflow: TextOverflow.fade,
//       style: const TextStyle(color: Colors.white),
//     );
//   }
//
//   void _handleBarcode(BarcodeCapture barcodes) {
//     if (mounted) {
//       setState(() {
//         _barcode = barcodes.barcodes.firstOrNull;
//       });
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//
//     _subscription = controller.barcodes.listen(_handleBarcode);
//
//     unawaited(controller.start());
//   }
//
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     super.didChangeAppLifecycleState(state);
//
//     switch (state) {
//       case AppLifecycleState.detached:
//       case AppLifecycleState.hidden:
//       case AppLifecycleState.paused:
//         return;
//       case AppLifecycleState.resumed:
//         _subscription = controller.barcodes.listen(_handleBarcode);
//
//         unawaited(controller.start());
//       case AppLifecycleState.inactive:
//         unawaited(_subscription?.cancel());
//         _subscription = null;
//         unawaited(controller.stop());
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'With controller',
//         ),
//       ),
//       backgroundColor: Colors.black,
//       body: Column(
//         children: [
//           Container(
//             height: 600.h,
//             width: 400.w,
//             margin: EdgeInsets.only(top: 80.h),
//             alignment: Alignment.center,
//             clipBehavior: Clip.antiAlias,
//             decoration: ShapeDecoration(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(
//                   16,
//                 ),
//               ),
//             ),
//             child: MobileScanner(
//               controller: controller,
//               errorBuilder: (context, error, child) {
//                 return ScannerErrorWidget(error: error);
//               },
//               fit: BoxFit.fill,
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               alignment: Alignment.bottomCenter,
//               height: 100,
//               color: Colors.black.withOpacity(0.4),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Expanded(child: Center(child: _buildBarcode(_barcode))),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Future<void> dispose() async {
//     WidgetsBinding.instance.removeObserver(this);
//     unawaited(_subscription?.cancel());
//     _subscription = null;
//     super.dispose();
//     await controller.dispose();
//   }
// }
