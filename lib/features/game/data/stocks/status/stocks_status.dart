import 'package:hive_flutter/hive_flutter.dart';

part 'stocks_status.g.dart';

@HiveType(typeId: 0)
enum StocksStatus {
  @HiveField(0)
  up('assets/icons/up.svg'),
  @HiveField(1)
  down('assets/icons/down.svg');

  final String assetPath;

  const StocksStatus(this.assetPath);
}
