import 'package:flutter/material.dart';

class DrawingClass {
  final Canvas canvas;
  final Map<Paint, List<Offset>> points;

  DrawingClass({
    required this.canvas,
    required this.points,
  });
}

class DrawingPainter extends CustomPainter {
  final Map<Paint, List<Offset>> points;

  DrawingPainter({
    required this.points,
  });

  @override
  void paint(Canvas canvas, Size size) async {
    for (var paint in points.keys) {
      for (var offsets in points.values) {
        for (int i = 0; i < offsets.length - 1; i++) {
          canvas.drawLine(offsets[i], offsets[i + 1], paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
