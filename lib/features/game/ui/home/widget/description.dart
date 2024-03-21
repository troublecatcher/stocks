import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks/theme/theme/const.dart';

class Description extends StatelessWidget {
  final String title;
  final String subtitle;

  const Description({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        SizedBox(height: 12.h),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                subtitle,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: c600),
              ),
            ),
          ],
        )
      ],
    );
  }
}
