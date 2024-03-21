import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stocks/features/game/data/stocks/stocks/stocks.dart';

class Percent extends StatelessWidget {
  const Percent({
    super.key,
    required this.stocksItem,
  });

  final Stocks stocksItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          stocksItem.event.status.assetPath,
          width: 16.sp,
          height: 16.sp,
        ),
        SizedBox(width: 10.w),
        Text(
          '${stocksItem.percent.toStringAsFixed(2)}%',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
