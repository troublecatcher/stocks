import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stocks/theme/theme/const.dart';

class Quantity extends StatelessWidget {
  final int quantity;

  const Quantity({
    super.key,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/bag.svg',
          width: 24.w,
          height: 22.h,
        ),
        SizedBox(width: 10.w),
        Text(
          quantity.toString(),
          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: c600),
        ),
      ],
    );
  }
}
