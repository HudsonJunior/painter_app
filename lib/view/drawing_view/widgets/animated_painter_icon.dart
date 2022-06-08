import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:painter_app/view/drawing_view/cubit/animated_painter_options_cubit.dart';

class AnimatedPainterIcon extends StatefulWidget {
  const AnimatedPainterIcon({Key? key}) : super(key: key);

  @override
  State<AnimatedPainterIcon> createState() => _AnimatedPainterIconState();
}

class _AnimatedPainterIconState extends State<AnimatedPainterIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final AnimatedPainterOptionsCubit animatedPainterOptionsCubit;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animatedPainterOptionsCubit =
        BlocProvider.of<AnimatedPainterOptionsCubit>(context);
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (animationController.isCompleted) {
          animationController.reverse();
          animatedPainterOptionsCubit.setStatus(
            AnimatedPainterOptionsStatus.closed,
          );
        } else {
          animationController.forward();
          animatedPainterOptionsCubit.setStatus(
            AnimatedPainterOptionsStatus.opened,
          );
        }
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        color: Colors.black,
        progress: Tween(begin: 0.0, end: 1.0).animate(
          animationController,
        ),
      ),
    );
  }
}
