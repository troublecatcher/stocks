import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks/features/settings/widget/settings_button_back.dart';
import 'package:stocks/features/settings/widget/settings_button_privacy_policy.dart';
import 'package:stocks/features/settings/widget/settings_button_restart_game.dart';
import 'package:stocks/features/settings/widget/settings_button_terms_of_use.dart';
import 'package:stocks/theme/theme/const.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const SettingsButtonBack(),
        centerTitle: false,
      ),
      backgroundColor: c200,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.sp),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              const SettingsButtonPrivacyPolicy(),
              SizedBox(height: 8.h),
              const SettingsButtonTermsOfUse(),
              SizedBox(height: 16.h),
              const SettingsButtonRestartGame(),
            ],
          ),
        ),
      ),
    );
  }
}
