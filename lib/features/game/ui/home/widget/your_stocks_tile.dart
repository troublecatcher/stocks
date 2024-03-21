import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks/theme/theme/const.dart';

class YourStocksTile extends StatelessWidget {
  const YourStocksTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 44.h,
          decoration: BoxDecoration(
              borderRadius: borderRadius8,
              gradient: RadialGradient(
                colors: yourStocksColors,
                radius: 3.sp,
              )),
          child: const Row(
            children: [
              Expanded(
                child: Text(
                  'Your Stocks',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
