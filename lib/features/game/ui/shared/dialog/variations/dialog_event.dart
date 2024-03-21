import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Dialog;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks/features/game/logic/balance/balance_cubit.dart';
import 'package:stocks/features/game/ui/shared/dialog/dialog.dart';
import 'package:stocks/features/game/ui/shared/widget/quantity.dart';
import 'package:stocks/features/game/data/stocks/stocks/stocks.dart';
import 'package:stocks/features/game/data/stocks/event/stocks_event.dart';
import 'package:stocks/features/game/ui/shared/button/buy_button.dart';
import 'package:stocks/features/game/ui/shared/widget/price.dart';
import 'package:stocks/features/game/ui/shared/button/sell_button.dart';
import 'package:stocks/features/game/ui/home/widget/stocks_shop_item.dart';
import 'package:stocks/router/router.dart';
import 'package:stocks/theme/theme/const.dart';

class DialogEvent extends Dialog {
  void showDialog(
    BuildContext context, {
    required Stocks stocks,
    required StocksEvent event,
    required bool userHasStocks,
    required int userHasStocksQuantity,
  }) {
    List<Widget> children = [
      SizedBox(height: 16.h),
      StocksShopItem(stocksItem: stocks),
      SizedBox(height: 30.h),
      Column(
        children: [
          const Row(
            children: [Text('You have')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Quantity(quantity: userHasStocksQuantity),
              Price(price: userHasStocksQuantity * stocks.price),
            ],
          ),
        ],
      ),
      SizedBox(height: 16.h),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Event information'),
          Text(
            event.title,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(event.description,
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(color: c600)),
        ],
      ),
      SizedBox(height: 16.h),
      Row(
        children: [
          if (userHasStocks)
            Expanded(child: SellButton(onPressed: () {
              context.router.popForced();
              context.router.push(SellRoute(stocksItem: stocks));
            })),
          if (context.read<BalanceCubit>().state >= stocks.price)
            SizedBox(width: 8.w),
          if (context.read<BalanceCubit>().state >= stocks.price)
            Expanded(child: BuyButton(onPressed: () {
              context.router.popForced();
              context.router.push(BuyRoute(stocksItem: stocks));
            })),
        ],
      ),
    ];
    buildDialog(
      context,
      children: children,
      title: 'New event!',
      closeButtonDoublePop: false,
    );
  }
}
