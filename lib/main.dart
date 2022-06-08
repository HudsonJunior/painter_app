import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:painter_app/view/drawing_view/cubit/animated_painter_options_cubit.dart';
import 'package:painter_app/view/drawing_view/pages/drawing_page.dart';
import 'package:painter_app/view_model/drawing_view_model/drawing_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DrawingCubit>(
          create: (_) => DrawingCubit(),
        ),
        BlocProvider<AnimatedPainterOptionsCubit>(
          create: (_) => AnimatedPainterOptionsCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Free drawing app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const DrawingPage(),
      ),
    );
  }
}
