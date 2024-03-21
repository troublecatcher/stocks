import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks/features/game/ui/shared/appbar/button/shop_button.dart';

class NoStocksPlaceholder extends StatelessWidget {
  const NoStocksPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 98.h),
        const Text('Buy your first Stock in shop'),
        SizedBox(height: 10.h),
        const ShopButton(),
      ],
    );
  }
}
