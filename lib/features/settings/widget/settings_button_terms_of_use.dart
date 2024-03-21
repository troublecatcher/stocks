import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks/router/router.dart';
import 'package:stocks/theme/shared/button/custom_gradient_button.dart';

class SettingsButtonTermsOfUse extends StatelessWidget {
  const SettingsButtonTermsOfUse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomGradientButton(
      children: [
        const Icon(
          Icons.list_alt_rounded,
          color: Colors.white,
        ),
        SizedBox(width: 5.w),
        Text(
          'Terms of use',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
      onPressed: () => context.router.push(const TermsOfUseRoute()),
    );
  }
}
