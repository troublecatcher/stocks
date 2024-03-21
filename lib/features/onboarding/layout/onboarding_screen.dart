import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stocks/features/onboarding/widget/onboarding_page.dart';
import 'package:stocks/features/onboarding/widget/page_indicator.dart';
import 'package:stocks/main.dart';
import 'package:stocks/router/router.dart';
import 'package:stocks/theme/shared/button/custom_single_color_button.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController pageController;
  late int page;

  @override
  void initState() {
    super.initState();
    page = 0;
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: const [
              OnboardingPage(
                assetPath: 'assets/images/logo.png',
                title: 'Stake App welcomes you!',
                subtitle:
                    'Learn how to buy/sell stocks safely! No money is needed, only your intuition.',
              ),
              OnboardingPage(
                assetPath: 'assets/images/onboarding2.png',
                title: 'How to play',
                subtitle:
                    'Buy first stocks. Generate event. Read the description. Repeat!',
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PageIndicator(page: page),
              SizedBox(height: 46.h),
              CustomSingleColorButton(
                title: page == 0 ? 'Next' : 'Start',
                onPressed: () {
                  if (page != 1) {
                    setState(() {
                      pageController.animateToPage(++page,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeOut);
                    });
                  } else {
                    locator<SharedPreferences>().setBool('isFirstTime', false);
                    context.router.replace(const HomeRoute());
                  }
                },
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(height: 8.h),
            ],
          ),
        ],
      )),
    );
  }
}
