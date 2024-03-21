import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Dialog;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:stocks/features/game/ui/shared/dialog/dialog.dart';
import 'package:stocks/features/game/ui/shared/widget/quantity.dart';
import 'package:stocks/features/game/data/stocks/stocks/stocks.dart';
import 'package:stocks/features/game/ui/shared/button/buy_button.dart';
import 'package:stocks/features/game/ui/shared/widget/price.dart';
import 'package:stocks/features/game/ui/shared/button/sell_button.dart';
import 'package:stocks/router/router.dart';
import 'package:stocks/theme/theme/const.dart';

class DialogPreTransaction extends Dialog {
  void showDialog(
    BuildContext context, {
    required Stocks stocksItem,
    required int quantity,
    required double totalPrice,
    required Transaction transaction,
  }) {
    List<Widget> children = [
      SizedBox(height: 16.h),
      Container(
        padding: padding,
        decoration: BoxDecoration(
          color: c200,
          borderRadius: borderRadius8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text('You have'),
                Quantity(quantity: quantity),
              ],
            ),
            Price(price: totalPrice),
          ],
        ),
      ),
      SizedBox(height: 16.h),
      Container(
        padding: padding,
        decoration: BoxDecoration(
          color: c200,
          borderRadius: borderRadius8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [
                Text('Sell price'),
                Quantity(quantity: 1),
              ],
            ),
            Price(price: stocksItem.price),
          ],
        ),
      ),
      SizedBox(height: 16.h),
      if (transaction == Transaction.buy)
        BuyButton(onPressed: () {
          context.router.popForced();
          context.router.push(BuyRoute(stocksItem: stocksItem));
        }),
      if (transaction == Transaction.sell)
        SellButton(onPressed: () {
          context.router.popForced();
          context.router.push(SellRoute(stocksItem: stocksItem));
        }),
    ];
    buildDialog(
      context,
      children: children,
      title: '${transaction.name.capitalize} ${stocksItem.name} Stocks',
      closeButtonDoublePop: false,
    );
  }
}
