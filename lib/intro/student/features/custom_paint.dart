import 'package:flutter/material.dart';

class customPaint extends StatelessWidget {
  const customPaint({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(painter: FingerPaint(),),
    );
  }
}

class FingerPaint extends CustomPainter
{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Path path = Path();
    // Adds an oval
    path.addOval(Rect.fromLTWH(size.width / 2, size.height / 2, size.width / 4, size.height / 4));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>true;

}
