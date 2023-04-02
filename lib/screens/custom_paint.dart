import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = const Color(0xff39425F);
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.25);

    path.quadraticBezierTo(
      size.width / 2.9,
      size.height / 2.5,
      size.width,
      size.height * 0.15,
    );
    path.lineTo(size.width, 0); //right side point
    path.lineTo(0, 0); //left side point

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}