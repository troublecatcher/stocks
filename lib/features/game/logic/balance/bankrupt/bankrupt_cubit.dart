import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks/features/game/logic/balance/balance_cubit.dart';
import 'package:stocks/features/game/logic/portfolio/portfolio_cubit.dart';
import 'package:stocks/features/game/logic/stocks/stocks_cubit.dart';

class BankruptCubit extends Cubit<bool> {
  final StocksCubit stocksCubit;
  final PortfolioCubit portfolioCubit;
  final BalanceCubit balanceCubit;
  BankruptCubit(
      {required this.stocksCubit,
      required this.portfolioCubit,
      required this.balanceCubit})
      : super(false) {
    isBankrupt();
  }

  bool isBankrupt() {
    double lowestPrice = stocksCubit.state[0].price;
    for (var i = 0; i < stocksCubit.state.length; i++) {
      if (stocksCubit.state[i].price < lowestPrice) {
        lowestPrice = stocksCubit.state[i].price;
      }
    }
    emit((balanceCubit.state < lowestPrice) && portfolioCubit.state.isEmpty);
    return (balanceCubit.state < lowestPrice) && portfolioCubit.state.isEmpty;
  }
}
