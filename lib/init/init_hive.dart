import 'package:hive_flutter/hive_flutter.dart';
import 'package:stocks/features/game/data/portfolio/portfolio_item.dart';
import 'package:stocks/features/game/data/stocks/event/stocks_event.dart';
import 'package:stocks/features/game/data/stocks/status/stocks_status.dart';
import 'package:stocks/features/game/data/stocks/stocks/stocks.dart';
import 'package:stocks/main.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PortfolioItemAdapter());
  Hive.registerAdapter(StocksStatusAdapter());
  Hive.registerAdapter(StocksEventAdapter());
  Hive.registerAdapter(StocksAdapter());
  stocksBox = await Hive.openBox('stocks');
  portfolioBox = await Hive.openBox('portfolio');
  // stocks!.clear();
  // portfolio!.clear();
}
