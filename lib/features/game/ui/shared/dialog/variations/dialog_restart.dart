import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Dialog;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stocks/features/game/logic/balance/balance_cubit.dart';
import 'package:stocks/features/game/ui/shared/dialog/dialog.dart';
import 'package:stocks/features/game/logic/portfolio/portfolio_cubit.dart';
import 'package:stocks/features/game/logic/stocks/stocks_cubit.dart';
import 'package:stocks/theme/shared/button/custom_gradient_button.dart';

class DialogRestart extends Dialog {
  void showDialog(BuildContext context) {
    List<Widget> children = [
      SizedBox(height: 16.h),
      const Text(
        'Your balance is insufficient! Try again, but think this time!',
        textAlign: TextAlign.center,
      ),
      SvgPicture.asset(
        'assets/images/well.svg',
        width: 254.sp,
        height: 254.sp,
      ),
      CustomGradientButton(
        onPressed: () => restartGame(context),
        children: const [
          Text(
            'Restart',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    ];
    buildDialog(
      context,
      children: children,
      title: 'Well...',
      showCloseIcon: false,
    );
  }

  static restartGame(BuildContext context) {
    context.read<StocksCubit>().reset();
    context.read<PortfolioCubit>().reset();
    context.read<BalanceCubit>().reset();
    context.router.popForced();
  }
}
