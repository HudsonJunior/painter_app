import 'package:bloc/bloc.dart';

enum AnimatedPainterOptionsStatus { opened, closed }

class AnimatedPainterOptionsCubit extends Cubit<AnimatedPainterOptionsStatus> {
  AnimatedPainterOptionsCubit() : super(AnimatedPainterOptionsStatus.closed);

  void setStatus(AnimatedPainterOptionsStatus status) {
    emit(status);
  }
}
