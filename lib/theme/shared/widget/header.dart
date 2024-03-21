import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks/theme/theme/const.dart';

class Header extends StatelessWidget {
  final String title;
  final String assetPath;
  final Widget? button;

  const Header({
    super.key,
    required this.title,
    required this.assetPath,
    this.button,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        color: c900,
        borderRadius: borderRadius8,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              Expanded(
                flex: 1,
                child: Image.asset(
                  assetPath,
                  width: 121.sp,
                  height: 121.sp,
                ),
              )
            ],
          ),
          if (button != null) button!
        ],
      ),
    );
  }
}
