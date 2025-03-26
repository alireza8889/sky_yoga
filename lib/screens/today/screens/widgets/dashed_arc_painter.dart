import 'package:flutter/material.dart';
import 'dart:math';

class DashedArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final double centerX = size.width / 2;
    final double centerY = size.height;
    final double radius = size.width / 2;

    for (double i = pi; i >= 0; i -= pi / 20) {
      final double x1 = centerX + radius * cos(i);
      final double y1 = centerY + radius * sin(i);
      final double x2 = centerX + radius * cos(i - pi / 40);
      final double y2 = centerY + radius * sin(i - pi / 40);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}