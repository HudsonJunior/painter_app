import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:painter_app/view_model/drawing_view_model/drawing_cubit.dart';

class DrawingClass {
  final Canvas canvas;
  final Map<Paint, List<Offset>> points;

  DrawingClass({
    required this.canvas,
    required this.points,
  });
}

class DrawingPainter extends CustomPainter {
  final ValueNotifier<Map<AppPaint, List<Offset>>> points;

  DrawingPainter({
    required this.points,
  }) : super(repaint: points);

  final Paint _paint = Paint()
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Size size) async {
    for (var obj in points.value.entries) {
      _paint
        ..color = obj.key.color
        ..strokeWidth = obj.key.strokeWidth;

      if (obj.value.length.isOdd) {
        canvas.drawPoints(
          PointMode.lines,
          obj.value..add(obj.value.last),
          _paint,
        );
      } else {
        canvas.drawPoints(PointMode.lines, obj.value, _paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
