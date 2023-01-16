import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class BackgroundPainter extends CustomPainter {
  // Height of scrolling offset.
  final double height;
  BackgroundPainter({
    required this.height
  });

  @override
  void paint(Canvas canvas, Size size) {
    double width = Get.width;
    Paint paint = Paint();

    // Start and end points of curve.
    double yPoint = 120 - height;
    // Control point that control a curve.
    double yControlPoint = yPoint + 80;

    Path ovalPath = Path();
    ovalPath.moveTo(0, 0);

    // Draw a line to y point.
    ovalPath.lineTo(0, yPoint);

    // Draw a curve from start to end point of curve.
    ovalPath.quadraticBezierTo(width * 0.5, yControlPoint, width, yPoint);

    ovalPath.lineTo(width, 0);
    paint.color = AppColors.blue;
    canvas.drawPath(ovalPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // Repaint all the time.
    return true;
  }
}