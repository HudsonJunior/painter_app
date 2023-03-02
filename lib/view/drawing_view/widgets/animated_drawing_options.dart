import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:painter_app/view/drawing_view/widgets/drawing_options.dart';
import 'package:painter_app/view_model/drawing_view_model/drawing_cubit.dart';

class AnimatedDrawingOptions extends StatefulWidget {
  const AnimatedDrawingOptions({Key? key}) : super(key: key);

  @override
  State<AnimatedDrawingOptions> createState() => _AnimatedDrawingOptionsState();
}

class _AnimatedDrawingOptionsState extends State<AnimatedDrawingOptions>
    with SingleTickerProviderStateMixin {
  double _endDrawingOptionsValue = 0.0;
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void onPressedFab() {
    setState(
      () {
        _endDrawingOptionsValue = _endDrawingOptionsValue == 0.0
            ? MediaQuery.of(context).size.width
            : 0.0;
      },
    );

    if (animationController.isCompleted) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 400),
      tween: Tween(begin: 0.0, end: _endDrawingOptionsValue),
      child: Positioned(
        bottom: 0,
        right: 0,
        child: BlocBuilder<DrawingCubit, AppPaint>(
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: onPressedFab,
              backgroundColor: Colors.amber,
              child: RotationTransition(
                turns: Tween(begin: 0.0, end: 0.8).animate(animationController),
                child: Icon(
                  FontAwesomeIcons.paintbrush,
                  color: state.color,
                ),
              ),
            );
          },
        ),
      ),
      builder: (context, value, child) {
        return Stack(
          children: [
            if (value > 20.0)
              Positioned(
                bottom: 0,
                right: 25,
                child: DrawingOptions(
                  width: value,
                ),
              ),
            child!,
          ],
        );
      },
    );
  }
}
