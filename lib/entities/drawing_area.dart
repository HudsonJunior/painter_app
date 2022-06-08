import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DrawingArea extends Equatable {
  final Offset point;
  final Paint areaPaint;

  const DrawingArea({
    required this.point,
    required this.areaPaint,
  });

  @override
  List<Object?> get props => [point, areaPaint];
}
