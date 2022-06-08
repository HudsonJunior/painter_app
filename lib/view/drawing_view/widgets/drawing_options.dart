import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:painter_app/view/drawing_view/widgets/color_picker.dart';
import 'package:painter_app/view_model/drawing_view_model/drawing_cubit.dart';

class DrawingOptions extends StatefulWidget {
  const DrawingOptions({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  State<DrawingOptions> createState() => _DrawingOptionsState();
}

class _DrawingOptionsState extends State<DrawingOptions> {
  late final DrawingCubit drawingCubit;

  @override
  void initState() {
    super.initState();
    drawingCubit = context.read<DrawingCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.85,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: BlocBuilder<DrawingCubit, DrawingState>(
        bloc: drawingCubit,
        builder: (context, drawingState) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: IconButton(
                  color: drawingState.currentColor,
                  onPressed: () {
                    ColorPicker.show(
                      context,
                      drawingCubit.updateCurrentColor,
                      drawingState.currentColor,
                    );
                  },
                  icon: const Icon(Icons.color_lens),
                ),
              ),
              Expanded(
                flex: 4,
                child: Slider(
                  value: drawingState.currentStrokeWidth,
                  min: 1.0,
                  max: 10.0,
                  activeColor: drawingState.currentColor,
                  thumbColor: drawingState.currentColor,
                  inactiveColor: drawingState.currentColor,
                  onChanged: drawingCubit.updateCurrentStrokeWidth,
                ),
              ),
              const Spacer(),
            ],
          );
        },
      ),
    );
  }
}
