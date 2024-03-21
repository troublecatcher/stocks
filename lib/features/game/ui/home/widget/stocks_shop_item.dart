import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks/features/game/data/stocks/stocks/stocks.dart';
import 'package:stocks/features/game/ui/shared/widget/percent.dart';
import 'package:stocks/features/game/ui/shared/widget/price.dart';
import 'package:stocks/theme/theme/const.dart';

class StocksShopItem extends StatelessWidget {
  const StocksShopItem({
    super.key,
    required this.stocksItem,
  });

  final Stocks stocksItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: c200,
        borderRadius: borderRadius8,
      ),
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  stocksItem.assetPath,
                  width: 46.sp,
                  height: 46.sp,
                ),
                Text(
                  stocksItem.name,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            Column(
              children: [
                Percent(stocksItem: stocksItem),
                SizedBox(height: 8.h),
                Price(price: stocksItem.price),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
