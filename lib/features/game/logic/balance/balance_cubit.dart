import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stocks/main.dart';

class BalanceCubit extends Cubit<double> {
  BalanceCubit() : super(0) {
    fetch();
  }

  fetch() {
    final money = locator<SharedPreferences>().getDouble('money');
    if (money == null) {
      locator<SharedPreferences>().setDouble('money', 2000);
      emit(2000);
    } else {
      emit(money);
    }
  }

  updateBalance(double value) {
    double balance = locator<SharedPreferences>().getDouble('money')!;
    double newBalance = balance += value;
    locator<SharedPreferences>().setDouble('money', newBalance);
    emit(newBalance);
  }

  reset() =>
      locator<SharedPreferences>().remove('money').whenComplete(() => fetch());
}
