import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks/theme/theme/const.dart';

class Price extends StatelessWidget {
  final double price;

  const Price({
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/icons/wallet.png',
          width: 24.sp,
          height: 24.sp,
        ),
        SizedBox(width: 10.w),
        Text(
          price.toStringAsFixed(2),
          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: c600),
        ),
      ],
    );
  }
}
