import 'package:hive_flutter/hive_flutter.dart';

part 'portfolio_item.g.dart';

@HiveType(typeId: 3)
class PortfolioItem {
  @HiveField(0)
  final String stocks;
  @HiveField(1)
  final int quantity;

  PortfolioItem({required this.stocks, required this.quantity});
}
