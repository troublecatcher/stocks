import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks/features/game/logic/bankrupt/bankrupt_cubit.dart';
import 'package:stocks/features/game/ui/shared/dialog/variations/dialog_event.dart';
import 'package:stocks/features/game/ui/shared/dialog/variations/dialog_restart.dart';
import 'package:stocks/features/game/logic/portfolio/portfolio_cubit.dart';
import 'package:stocks/features/game/logic/stocks/stocks_cubit.dart';
import 'package:stocks/features/game/data/portfolio/portfolio_item.dart';
import 'package:stocks/theme/shared/button/custom_gradient_button.dart';

class GenerateEventButton extends StatelessWidget {
  const GenerateEventButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioCubit, List<PortfolioItem>>(
      builder: (context, portfolioState) {
        return CustomGradientButton(
          onPressed: () {
            if (context.read<BankruptCubit>().isBankrupt()) {
              DialogRestart().showDialog(context);
            } else {
              final event = context.read<StocksCubit>().generateEvent();
              final newStocks = context.read<StocksCubit>().affectStocks(event);
              bool userHasStocks;
              int userHasStocksQuantity = 0;
              try {
                final matchedStocks = portfolioState
                    .firstWhere((element) => element.stocks == newStocks.name);
                userHasStocks = true;
                userHasStocksQuantity = matchedStocks.quantity;
              } catch (e) {
                userHasStocks = false;
              }
              DialogEvent().showDialog(
                context,
                stocks: newStocks,
                event: event,
                userHasStocks: userHasStocks,
                userHasStocksQuantity: userHasStocksQuantity,
              );
            }
          },
          padding: EdgeInsets.zero,
          children: [
            Text(
              'Generate',
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        );
      },
    );
  }
}
