import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stocks/theme/shared/button/custom_icon_button.dart';
import 'package:stocks/theme/theme/const.dart';

class SettingsButtonBack extends StatelessWidget {
  const SettingsButtonBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: const Icon(Icons.arrow_upward_rounded),
      onPressed: () => context.router.popForced(),
      color: c500,
    );
  }
}
