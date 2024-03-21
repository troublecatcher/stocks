import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks/theme/theme/const.dart';

class CustomGradientButton extends StatelessWidget {
  final List<Widget> children;
  final Function()? onPressed;
  final EdgeInsets? padding;
  final double? radius;

  const CustomGradientButton(
      {super.key,
      required this.children,
      this.onPressed,
      this.padding,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      color: Colors.transparent,
      onPressed: onPressed,
      child: Container(
        height: 46.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: borderRadius8,
            gradient: RadialGradient(
              colors: gradientButtonColors,
              radius: radius ?? 3,
            )),
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
