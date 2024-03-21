import 'package:hive_flutter/hive_flutter.dart';
import 'package:stocks/features/game/data/stocks/event/stocks_event.dart';

part 'stocks.g.dart';

@HiveType(typeId: 2)
class Stocks {
  @HiveField(0)
  final int index;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String assetPath;
  @HiveField(3)
  final double price;
  @HiveField(4)
  final double percent;
  @HiveField(5)
  final StocksEvent event;

  const Stocks({
    required this.index,
    required this.name,
    required this.assetPath,
    required this.price,
    required this.percent,
    required this.event,
  });

  static List<String> stocksNamesList = [
    'Technology',
    'Energy',
    'Pharmaceutical',
    'Financial',
    'Retail',
  ];
}
