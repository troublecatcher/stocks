import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stocks/main.dart';

import '../features/game/ui/screens/home_screen.dart';
import '../features/onboarding/layout/onboarding_screen.dart';
import '../features/promotion/promotion_screen.dart';
import '../features/settings/screen/privacy_policy_screen.dart';
import '../features/settings/screen/settings_screen.dart';
import '../features/settings/screen/terms_of_use_screen.dart';
import '../features/game/ui/screens/buy_screen.dart';
import '../features/game/ui/screens/sell_screen.dart';
import '../features/game/data/stocks/stocks/stocks.dart';

part 'router.gr.dart';

final showPromotion = promotion != null && promotion != '';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: OnboardingRoute.page,
            initial: isFirstTime! && !showPromotion),
        CustomRoute(
            page: HomeRoute.page,
            initial: !isFirstTime! && !showPromotion,
            transitionsBuilder: TransitionsBuilders.fadeIn),
        AutoRoute(page: BuyRoute.page),
        AutoRoute(page: SellRoute.page),
        CustomRoute(
            page: SettingsRoute.page,
            transitionsBuilder: TransitionsBuilders.slideTop),
        AutoRoute(page: PromotionRoute.page, initial: showPromotion),
        AutoRoute(page: PrivacyPolicyRoute.page),
        AutoRoute(page: TermsOfUseRoute.page),
      ];
}
