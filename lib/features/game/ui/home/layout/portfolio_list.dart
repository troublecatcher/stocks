import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks/features/game/logic/balance/balance_cubit.dart';
import 'package:stocks/features/game/ui/shared/dialog/dialog.dart';
import 'package:stocks/features/game/ui/shared/dialog/variations/dialog_pre_transaction.dart';
import 'package:stocks/features/game/ui/shared/widget/quantity.dart';
import 'package:stocks/features/game/logic/portfolio/portfolio_cubit.dart';
import 'package:stocks/features/game/logic/stocks/stocks_cubit.dart';
import 'package:stocks/features/game/data/portfolio/portfolio_item.dart';
import 'package:stocks/features/game/data/stocks/stocks/stocks.dart';
import 'package:stocks/features/game/ui/shared/button/buy_button.dart';
import 'package:stocks/features/game/ui/shared/widget/percent.dart';
import 'package:stocks/features/game/ui/shared/widget/price.dart';
import 'package:stocks/features/game/ui/shared/button/sell_button.dart';
import 'package:stocks/theme/theme/const.dart';

class PortfolioList extends StatelessWidget {
  const PortfolioList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BalanceCubit, double>(
      builder: (context, balanceState) {
        return BlocBuilder<PortfolioCubit, List<PortfolioItem>>(
          builder: (context, portfolioList) {
            return BlocBuilder<StocksCubit, List<Stocks>>(
              builder: (context, stocksList) {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: portfolioList.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return SizedBox(height: 8.h);
                    }
                    final portfolioItem = portfolioList[index - 1];
                    final stocksItem = stocksList.firstWhere(
                        (element) => element.name == portfolioItem.stocks);
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        color: c200,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.sp),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    stocksItem.assetPath,
                                    width: 100.sp,
                                    height: 100.sp,
                                  ),
                                ),
                                Expanded(
                                    child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(stocksItem.name),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Price(price: stocksItem.price),
                                        Percent(stocksItem: stocksItem),
                                      ],
                                    ),
                                    const Row(children: [Text('You have')]),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Quantity(
                                            quantity: portfolioItem.quantity),
                                        Price(
                                            price: stocksItem.price *
                                                portfolioItem.quantity),
                                      ],
                                    ),
                                  ],
                                )),
                              ],
                            ),
                            Row(
                              children: [
                                if (balanceState >= stocksItem.price)
                                  Expanded(
                                      child: BuyButton(
                                          onPressed: () =>
                                              DialogPreTransaction().showDialog(
                                                  context,
                                                  stocksItem: stocksItem,
                                                  quantity:
                                                      portfolioItem.quantity,
                                                  totalPrice: stocksItem.price *
                                                      portfolioItem.quantity,
                                                  transaction:
                                                      Transaction.buy))),
                                if (balanceState >= stocksItem.price)
                                  SizedBox(width: 8.w),
                                Expanded(
                                    child: SellButton(
                                        onPressed: () => DialogPreTransaction()
                                            .showDialog(context,
                                                stocksItem: stocksItem,
                                                quantity:
                                                    portfolioItem.quantity,
                                                totalPrice: stocksItem.price *
                                                    portfolioItem.quantity,
                                                transaction:
                                                    Transaction.sell))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 8.h),
                );
              },
            );
          },
        );
      },
    );
  }
}
