import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks/features/game/data/stocks/stocks/stocks.dart';
import 'package:stocks/features/game/logic/balance/balance_cubit.dart';
import 'package:stocks/features/game/logic/stocks/stocks_cubit.dart';
import 'package:stocks/features/game/ui/home/widget/stocks_shop_item.dart';
import 'package:stocks/router/router.dart';
import 'package:stocks/theme/shared/widget/header.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
      child: Column(
        children: [
          const Header(
            title: 'Here you can buy all Stocks',
            assetPath: 'assets/images/shop.png',
          ),
          SizedBox(height: 20.h),
          BlocBuilder<BalanceCubit, double>(
            builder: (_, __) {
              return BlocBuilder<StocksCubit, List<Stocks>>(
                builder: (context, state) {
                  return Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: state.length,
                      itemBuilder: (context, index) {
                        Stocks stocksItem = state[index];
                        return CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: context.read<BalanceCubit>().state >=
                                    stocksItem.price
                                ? () => context.router
                                    .push(BuyRoute(stocksItem: stocksItem))
                                : null,
                            child: StocksShopItem(stocksItem: stocksItem));
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 8.h),
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
