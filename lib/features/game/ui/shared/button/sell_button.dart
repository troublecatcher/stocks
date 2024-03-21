import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stocks/theme/shared/button/custom_gradient_button.dart';

class SellButton extends StatelessWidget {
  final Function() onPressed;

  const SellButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomGradientButton(
      onPressed: onPressed,
      children: [
        SvgPicture.asset(
          'assets/icons/sell.svg',
          width: 19.sp,
          height: 19.sp,
        ),
        SizedBox(width: 5.w),
        Text(
          'Sell',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
