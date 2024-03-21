import 'package:flutter/material.dart';
import 'package:stocks/theme/theme/const.dart';

class CustomIconButton extends StatelessWidget {
  final Widget icon;
  final Function() onPressed;
  final Color color;

  const CustomIconButton(
      {super.key,
      required this.icon,
      required this.onPressed,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
        backgroundColor: MaterialStatePropertyAll(color),
        splashFactory: NoSplash.splashFactory,
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: borderRadius12)),
      ),
      child: SizedBox(
        width: 44,
        height: 44,
        child: icon,
      ),
    );
  }
}
