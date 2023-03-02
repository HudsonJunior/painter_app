import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:painter_app/view/drawing_view/cubit/animated_painter_options_cubit.dart';
import 'package:painter_app/view/drawing_view/widgets/painter_options.dart';

class AnimatedPainterOptions extends StatefulWidget {
  final VoidCallback onClean;
  const AnimatedPainterOptions({Key? key, required this.onClean})
      : super(key: key);

  @override
  State<AnimatedPainterOptions> createState() => _AnimatedPainterOptionsState();
}

class _AnimatedPainterOptionsState extends State<AnimatedPainterOptions>
    with SingleTickerProviderStateMixin {
  double _endPainterOptionsHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AnimatedPainterOptionsCubit,
        AnimatedPainterOptionsStatus>(
      listener: (context, state) {
        if (state == AnimatedPainterOptionsStatus.opened) {
          setState(() {
            _endPainterOptionsHeight =
                MediaQuery.of(context).size.height * 0.25;
          });
        } else {
          setState(() {
            _endPainterOptionsHeight = 0.0;
          });
        }
      },
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: _endPainterOptionsHeight),
        duration: const Duration(milliseconds: 300),
        builder: (context, value, child) {
          return Container(
            height: value,
            width: 60,
            decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24.0),
                bottomRight: Radius.circular(24.0),
              ),
            ),
            child: child,
          );
        },
        child: PainterOptions(onClean: widget.onClean),
      ),
    );
  }
}
