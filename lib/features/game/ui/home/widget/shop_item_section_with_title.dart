import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks/theme/theme/const.dart';

class ShopItemSectionWithTitle extends StatelessWidget {
  final String title;
  final Color color;
  final Widget child;

  const ShopItemSectionWithTitle({
    super.key,
    required this.title,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.all(8.sp),
          decoration: BoxDecoration(
            color: color,
            borderRadius: borderRadius8,
          ),
          child: child,
        )
      ],
    );
  }
}
