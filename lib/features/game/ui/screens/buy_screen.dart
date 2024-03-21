import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks/features/game/logic/balance/balance_cubit.dart';
import 'package:stocks/features/game/ui/home/widget/description.dart';
import 'package:stocks/features/game/ui/shared/dialog/dialog.dart';
import 'package:stocks/features/game/ui/shared/dialog/variations/dialog_post_transaction.dart';
import 'package:stocks/features/game/logic/portfolio/portfolio_cubit.dart';
import 'package:stocks/features/game/data/stocks/stocks/stocks.dart';
import 'package:stocks/features/game/ui/shared/button/buy_button.dart';
import 'package:stocks/features/game/ui/home/widget/shop_item_section_with_title.dart';
import 'package:stocks/features/game/ui/home/widget/stocks_shop_item.dart';
import 'package:stocks/theme/theme/const.dart';
import 'package:stocks/features/game/ui/shared/appbar/widget/balance.dart';

@RoutePage()
class BuyScreen extends StatefulWidget {
  final Stocks stocksItem;

  const BuyScreen({super.key, required this.stocksItem});

  @override
  State<BuyScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  late int quantity;
  late double totalPrice;

  @override
  void initState() {
    super.initState();
    quantity = 1;
    totalPrice = widget.stocksItem.price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: c100,
        title: const Text('Buy'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            child: Column(
              children: [
                BlocBuilder<BalanceCubit, double>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'You have',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        const BalanceIndicator(),
                      ],
                    );
                  },
                ),
                SizedBox(height: 16.h),
                ShopItemSectionWithTitle(
                  title: 'Type of stocks',
                  color: c200,
                  child: StocksShopItem(
                    stocksItem: widget.stocksItem,
                  ),
                ),
                SizedBox(height: 16.h),
                ShopItemSectionWithTitle(
                  title: 'Quantity of stocks',
                  color: c200,
                  child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: Row(
                        children: [
                          Text(
                            quantity.toString(),
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      onPressed: () => showCupertinoModalPopup(
                            context: context,
                            builder: (_) => SizedBox(
                              width: double.infinity,
                              height: 250,
                              child: CupertinoPicker(
                                backgroundColor: c100,
                                itemExtent: 30,
                                scrollController: FixedExtentScrollController(),
                                children: List.generate(
                                    context.read<BalanceCubit>().state ~/
                                        widget.stocksItem.price,
                                    (index) => Text((index + 1).toString())),
                                onSelectedItemChanged: (value) => setState(() {
                                  quantity = value + 1;
                                  totalPrice =
                                      widget.stocksItem.price * quantity;
                                }),
                              ),
                            ),
                          )),
                ),
                SizedBox(height: 16.h),
                Description(
                  title: widget.stocksItem.event.title,
                  subtitle: widget.stocksItem.event.description,
                ),
                SizedBox(height: 20.h),
                Container(
                  padding: padding,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius8,
                    color: c200,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total price',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Text(totalPrice.toStringAsFixed(2)),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                BuyButton(
                  onPressed: () {
                    context.read<PortfolioCubit>().buy(
                        stocksName: widget.stocksItem.name,
                        quantity: quantity,
                        totalPrice: totalPrice);
                    DialogPostTransaction().showDialog(context,
                        stocksName: widget.stocksItem.name,
                        quantity: quantity,
                        totalPrice: totalPrice,
                        transaction: Transaction.buy);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
