import 'package:flutter_bloc/flutter_bloc.dart';

class TypingCubit extends Cubit<TypingState> {
  TypingCubit() : super(TypingInitial());
  int? count;
  
  List<String> randomSoz = [
    "Salom", "Hello", "Ipsum", "Lorem", "Snake4"
  ];
  void fix(List<String> words) {
    num jami = 0;
    
  }
}

abstract class TypingState {
  TypingState();
}

class TypingInitial extends TypingState {
  TypingInitial();
}
