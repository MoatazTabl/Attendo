import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BuildBarCode extends StatelessWidget {
  const BuildBarCode({super.key, required this.barcode});

  final Barcode? barcode;

  @override
  Widget build(BuildContext context) {
    if (barcode == null) {
      return const Text(
        'Scan Qr Code',
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
