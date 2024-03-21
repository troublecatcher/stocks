import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks/features/game/data/portfolio/portfolio_item.dart';
import 'package:stocks/features/game/logic/portfolio/portfolio_cubit.dart';
import 'package:stocks/features/game/ui/home/layout/portfolio_list.dart';
import 'package:stocks/features/game/ui/home/widget/no_stocks_placeholder.dart';
import 'package:stocks/features/game/ui/home/widget/your_stocks_tile.dart';
import 'package:stocks/features/game/ui/shared/button/generate_event_button.dart';
import 'package:stocks/theme/shared/widget/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
        child: Column(
          children: [
            const Header(
              title: 'Events of the day',
              assetPath: 'assets/images/dice1.png',
              button: GenerateEventButton(),
            ),
            SizedBox(height: 20.h),
            const YourStocksTile(),
            BlocBuilder<PortfolioCubit, List<PortfolioItem>>(
              builder: (context, state) {
                if (state.isEmpty) {
                  return const NoStocksPlaceholder();
                } else {
                  return const PortfolioList();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
