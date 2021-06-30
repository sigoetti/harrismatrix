import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawRect(Rect.fromPoints(Offset.zero, Offset(50, 50)), paint);
  }

  @override
  bool shouldRepaint(RectanglePainter oldDelegate) => false;
}
