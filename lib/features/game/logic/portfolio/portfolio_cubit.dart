import 'package:bloc/bloc.dart';
import 'package:stocks/features/game/logic/balance/balance_cubit.dart';
import 'package:stocks/features/game/data/portfolio/portfolio_item.dart';
import 'package:stocks/main.dart';

class PortfolioCubit extends Cubit<List<PortfolioItem>> {
  final BalanceCubit balanceCubit;
  PortfolioCubit({required this.balanceCubit}) : super([]) {
    fetch();
  }

  fetch() {
    if (portfolioBox!.isNotEmpty) {
      List<PortfolioItem> portfolioList = [];
      for (var i = 0; i < portfolioBox!.length; i++) {
        final portfolioItem = portfolioBox!.getAt(i) as PortfolioItem;
        portfolioList.add(PortfolioItem(
            stocks: portfolioItem.stocks, quantity: portfolioItem.quantity));
      }
      emit(portfolioList);
    } else {
      emit([]);
    }
  }

  buy({
    required String stocksName,
    required int quantity,
    required double totalPrice,
  }) {
    try {
      final matchedStocks =
          state.firstWhere((element) => element.stocks == stocksName);
      final matchedStocksQuantity = matchedStocks.quantity;
      final newQuantity = matchedStocksQuantity + quantity;
      portfolioBox!.put(
          stocksName, PortfolioItem(stocks: stocksName, quantity: newQuantity));
      fetch();
    } catch (e) {
      portfolioBox!.put(
          stocksName, PortfolioItem(stocks: stocksName, quantity: quantity));
      fetch();
    }
    balanceCubit.updateBalance(-totalPrice);
  }

  sell({
    required String stocksName,
    required int quantity,
    required double totalPrice,
  }) {
    final matchedStocks =
        state.firstWhere((element) => element.stocks == stocksName);
    final matchedStocksQuantity = matchedStocks.quantity;
    if (matchedStocksQuantity == quantity) {
      portfolioBox!.delete(stocksName);
    } else {
      final newQuantity = matchedStocksQuantity - quantity;
      portfolioBox!.put(
          stocksName, PortfolioItem(stocks: stocksName, quantity: newQuantity));
    }
    fetch();
    balanceCubit.updateBalance(totalPrice);
  }

  reset() => portfolioBox!.clear().whenComplete(() => fetch());
}
