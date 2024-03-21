import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stocks/router/router.dart';
import 'package:stocks/theme/theme/const.dart';
import 'package:stocks/theme/shared/button/custom_icon_button.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: SvgPicture.asset('assets/icons/settings.svg'),
      onPressed: () => context.router.push(const SettingsRoute()),
      color: c500,
    );
  }
}
