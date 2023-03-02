import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:painter_app/view/drawing_view/widgets/animated_drawing_options.dart';
import 'package:painter_app/view/drawing_view/widgets/animated_painter_icon.dart';
import 'package:painter_app/view/drawing_view/widgets/animated_painter_options.dart';
import 'package:painter_app/view/drawing_view/widgets/drawing_painter.dart';
import 'package:painter_app/view_model/drawing_view_model/drawing_cubit.dart';

class DrawingPage extends StatefulWidget {
  const DrawingPage({Key? key}) : super(key: key);

  @override
  State<DrawingPage> createState() => _DrawingPageState();
}

class _DrawingPageState extends State<DrawingPage> {
  late final ValueNotifier<Map<AppPaint, List<Offset>>> points;
  late final DrawingCubit drawingCubit;

  @override
  void initState() {
    super.initState();
    points = ValueNotifier({});
    drawingCubit = context.read<DrawingCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0.0,
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 6.0),
            child: AnimatedPainterIcon(),
          )
        ],
        title: const Text(
          "Meu desenho",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: const AnimatedDrawingOptions(),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 3.0,
                      spreadRadius: 0.5,
                    )
                  ],
                ),
                child: GestureDetector(
                  onPanDown: (details) {
                    points.value = Map<AppPaint, List<Offset>>.from(points.value
                      ..update(
                        drawingCubit.state,
                        (listOffset) => listOffset..add(details.localPosition),
                        ifAbsent: () => [details.localPosition],
                      ));
                  },
                  onPanUpdate: (details) {
                    points.value = Map<AppPaint, List<Offset>>.from(points.value
                      ..update(
                        drawingCubit.state,
                        (listOffset) => listOffset..add(details.localPosition),
                        ifAbsent: () => [details.localPosition],
                      ));
                  },
                  child: RepaintBoundary(
                    child: CustomPaint(
                      painter: DrawingPainter(points: points),
                      child: const SizedBox.expand(),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0.0,
              right: 0.0,
              child: AnimatedPainterOptions(
                onClean: () {
                  points.value = {};
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
