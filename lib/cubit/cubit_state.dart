import 'package:flutter_bloc/flutter_bloc.dart';

class TypingCubit extends Cubit<TypingState> {
  TypingCubit() : super(TypingInitial());
}

abstract class TypingState {
  TypingState();
}

class TypingInitial extends TypingState {
  TypingInitial();
}


