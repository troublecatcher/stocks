import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:stocks/features/game/data/stocks/stocks/stocks.dart';
import 'package:stocks/features/game/data/stocks/event/stocks_event.dart';
import 'package:stocks/features/game/data/stocks/status/stocks_status.dart';
import 'package:stocks/main.dart';

class StocksCubit extends Cubit<List<Stocks>> {
  StocksCubit() : super([]) {
    fetch();
  }

  fetch() {
    if (stocksBox!.isEmpty) {
      for (var i = 0; i < Stocks.stocksNamesList.length; i++) {
        stocksBox!.put(
          i,
          Stocks(
            index: i,
            name: Stocks.stocksNamesList[i],
            assetPath:
                'assets/stocks/${Stocks.stocksNamesList[i].toLowerCase()}.png',
            price: 141.55,
            percent: 0.18,
            event: StocksEvent.stocksEventList[Random().nextInt(20)],
          ),
        );
      }
    }
    List<Stocks> stocksList = [];
    for (var i = 0; i < stocksBox!.length; i++) {
      stocksList.add(stocksBox!.getAt(i));
    }
    emit(stocksList);
  }

  StocksEvent generateEvent() {
    final randomEventIndex = Random().nextInt(20);
    final event = StocksEvent.stocksEventList[randomEventIndex];
    return event;
  }

  Stocks affectStocks(StocksEvent event) {
    final randomStocksIndex = Random().nextInt(5);

    final randomPercent = 0.1 + Random().nextDouble() * (2 - 0.1);

    final randomStocks = state[randomStocksIndex];
    final oldPrice = randomStocks.price;
    double newPrice = oldPrice;
    switch (event.status) {
      case StocksStatus.up:
        newPrice += oldPrice * randomPercent / 100;
        break;
      case StocksStatus.down:
        newPrice -= oldPrice * randomPercent / 100;
        break;
    }

    final newStocks = Stocks(
        index: randomStocks.index,
        name: randomStocks.name,
        assetPath: randomStocks.assetPath,
        price: newPrice,
        percent: randomPercent,
        event: event);
    stocksBox!.putAt(randomStocks.index, newStocks);
    fetch();
    return newStocks;
  }

  reset() => stocksBox!.clear().whenComplete(() => fetch());
}
