import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks/features/game/logic/balance/balance_cubit.dart';
import 'package:stocks/theme/shared/widget/custom_container.dart';

class BalanceIndicator extends StatelessWidget {
  const BalanceIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BalanceCubit, double>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(right: 15.sp),
          child: SizedBox(
            width: 157.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CustomContainer(
                    width: 157.w,
                    height: 31.h,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icons/wallet.png',
                        width: 48.sp,
                        height: 48.sp,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: Text(
                          state.toStringAsFixed(2),
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
