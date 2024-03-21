import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks/features/game/ui/shared/dialog/variations/dialog_restart.dart';
import 'package:stocks/theme/shared/button/custom_gradient_button.dart';

class SettingsButtonRestartGame extends StatelessWidget {
  const SettingsButtonRestartGame({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomGradientButton(
      children: [
        const Icon(
          Icons.restart_alt_rounded,
          color: Colors.white,
        ),
        SizedBox(width: 5.w),
        Text(
          'Restart game',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
      onPressed: () => DialogRestart.restartGame(context),
    );
  }
}
