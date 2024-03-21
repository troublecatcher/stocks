import 'package:bloc/bloc.dart';

class PageCubit extends Cubit<int> {
  PageCubit() : super(0);

  inc() {
    if (state != 1) {
      emit(state + 1);
    }
  }

  dec() {
    if (state != 0) {
      emit(state - 1);
    }
  }

  set(page) => emit(page);
}
