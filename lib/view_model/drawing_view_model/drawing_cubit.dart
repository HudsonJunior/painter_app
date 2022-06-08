import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class DrawingState {
  final Color currentColor;
  final double currentStrokeWidth;

  DrawingState({
    required this.currentColor,
    required this.currentStrokeWidth,
  });

  factory DrawingState.firstState() => DrawingState(
        currentColor: Colors.black,
        currentStrokeWidth: 2.0,
      );

  DrawingState copyWith({
    Color? currentColor,
    double? currentStrokeWidth,
  }) {
    return DrawingState(
      currentColor: currentColor ?? this.currentColor,
      currentStrokeWidth: currentStrokeWidth ?? this.currentStrokeWidth,
    );
  }
}

class DrawingCubit extends Cubit<DrawingState> {
  DrawingCubit() : super(DrawingState.firstState());

  final Paint currentPaint = Paint()
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..strokeWidth = 2.0
    ..color = Colors.black;

  void updateCurrentColor(Color newColor) {
    emit(state.copyWith(currentColor: newColor));
    currentPaint.color = newColor;
  }

  void updateCurrentStrokeWidth(double newStrokeWidth) {
    emit(state.copyWith(currentStrokeWidth: newStrokeWidth));
    currentPaint.strokeWidth = newStrokeWidth;
  }
}
