import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stocks/theme/shared/button/custom_gradient_button.dart';

class BuyButton extends StatelessWidget {
  final Function()? onPressed;

  const BuyButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomGradientButton(
      onPressed: onPressed,
      children: [
        SvgPicture.asset(
          'assets/icons/buy.svg',
          width: 19.sp,
          height: 19.sp,
        ),
        SizedBox(width: 3.w),
        Text(
          'Buy',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
