import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSingleColorButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final Color color;
  final EdgeInsets? padding;

  const CustomSingleColorButton(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.color,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: padding ?? EdgeInsets.symmetric(horizontal: 28.w),
            child: CupertinoButton(
              color: color,
              onPressed: onPressed,
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
