import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Dialog;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks/features/game/logic/bankrupt/bankrupt_cubit.dart';
import 'package:stocks/features/game/ui/shared/dialog/dialog.dart';
import 'package:stocks/features/game/ui/shared/dialog/variations/dialog_restart.dart';
import 'package:stocks/features/game/ui/shared/widget/quantity.dart';
import 'package:stocks/features/game/ui/shared/widget/price.dart';
import 'package:stocks/theme/shared/button/custom_gradient_button.dart';

class DialogPostTransaction extends Dialog {
  void showDialog(
    BuildContext context, {
    required String stocksName,
    required int quantity,
    required double totalPrice,
    required Transaction transaction,
  }) {
    List<Widget> children = [
      SizedBox(height: 30.h),
      Column(
        children: [
          Row(
            children: [Text('You ${transaction.word}')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Quantity(quantity: quantity),
              Price(price: totalPrice),
            ],
          ),
        ],
      ),
      SizedBox(height: 16.h),
      CustomGradientButton(
        children: [
          Text(
            'Continue',
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
        onPressed: () {
          context.router
            ..popForced()
            ..popForced();
          if (context.read<BankruptCubit>().isBankrupt()) {
            DialogRestart().showDialog(context);
          }
        },
      ),
    ];
    buildDialog(
      context,
      children: children,
      title: 'Congratulations, you ${transaction.word} the $stocksName stocks!',
    );
  }
}
