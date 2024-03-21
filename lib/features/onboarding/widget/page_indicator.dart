import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.page,
  });

  final int page;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 10.sp,
          height: 10.sp,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: page == 0 ? Theme.of(context).primaryColor : Colors.white),
        ),
        SizedBox(width: 8.w),
        Container(
          width: 10.sp,
          height: 10.sp,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: page == 1 ? Theme.of(context).primaryColor : Colors.white),
        ),
      ],
    );
  }
}
