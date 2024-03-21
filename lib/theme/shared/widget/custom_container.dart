import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks/theme/theme/const.dart';

class CustomContainer extends StatelessWidget {
  final Color? color;
  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsets? margin;

  const CustomContainer(
      {super.key,
      this.color,
      this.child,
      this.width,
      this.height,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(8.sp),
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? c500,
        borderRadius: borderRadius12,
      ),
      child: child,
    );
  }
}
