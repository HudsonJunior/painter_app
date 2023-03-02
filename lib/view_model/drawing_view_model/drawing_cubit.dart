import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppPaint extends Equatable {
  final Color color;
  final double strokeWidth;

  const AppPaint({
    required this.color,
    required this.strokeWidth,
  });

  factory AppPaint.initial() => const AppPaint(
        color: Colors.black,
        strokeWidth: 2.0,
      );

  @override
  List<Object?> get props => [color, strokeWidth];

  AppPaint copyWith({
    Color? color,
    double? strokeWidth,
  }) {
    return AppPaint(
      color: color ?? this.color,
      strokeWidth: strokeWidth ?? this.strokeWidth,
    );
  }
}

class DrawingCubit extends Cubit<AppPaint> {
  DrawingCubit() : super(AppPaint.initial());

  void updateCurrentColor(Color newColor) {
    emit(state.copyWith(color: newColor));
  }

  void updateCurrentStrokeWidth(double newStrokeWidth) {
    emit(state.copyWith(strokeWidth: newStrokeWidth));
  }
}
