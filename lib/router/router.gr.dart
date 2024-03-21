// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BuyRoute.name: (routeData) {
      final args = routeData.argsAs<BuyRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BuyScreen(
          key: args.key,
          stocksItem: args.stocksItem,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    PrivacyPolicyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PrivacyPolicyScreen(),
      );
    },
    PromotionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PromotionScreen(),
      );
    },
    SellRoute.name: (routeData) {
      final args = routeData.argsAs<SellRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SellScreen(
          key: args.key,
          stocksItem: args.stocksItem,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    TermsOfUseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TermsOfUseScreen(),
      );
    },
  };
}

/// generated route for
/// [BuyScreen]
class BuyRoute extends PageRouteInfo<BuyRouteArgs> {
  BuyRoute({
    Key? key,
    required Stocks stocksItem,
    List<PageRouteInfo>? children,
  }) : super(
          BuyRoute.name,
          args: BuyRouteArgs(
            key: key,
            stocksItem: stocksItem,
          ),
          initialChildren: children,
        );

  static const String name = 'BuyRoute';

  static const PageInfo<BuyRouteArgs> page = PageInfo<BuyRouteArgs>(name);
}

class BuyRouteArgs {
  const BuyRouteArgs({
    this.key,
    required this.stocksItem,
  });

  final Key? key;

  final Stocks stocksItem;

  @override
  String toString() {
    return 'BuyRouteArgs{key: $key, stocksItem: $stocksItem}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PrivacyPolicyScreen]
class PrivacyPolicyRoute extends PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<PageRouteInfo>? children})
      : super(
          PrivacyPolicyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PromotionScreen]
class PromotionRoute extends PageRouteInfo<void> {
  const PromotionRoute({List<PageRouteInfo>? children})
      : super(
          PromotionRoute.name,
          initialChildren: children,
        );

  static const String name = 'PromotionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SellScreen]
class SellRoute extends PageRouteInfo<SellRouteArgs> {
  SellRoute({
    Key? key,
    required Stocks stocksItem,
    List<PageRouteInfo>? children,
  }) : super(
          SellRoute.name,
          args: SellRouteArgs(
            key: key,
            stocksItem: stocksItem,
          ),
          initialChildren: children,
        );

  static const String name = 'SellRoute';

  static const PageInfo<SellRouteArgs> page = PageInfo<SellRouteArgs>(name);
}

class SellRouteArgs {
  const SellRouteArgs({
    this.key,
    required this.stocksItem,
  });

  final Key? key;

  final Stocks stocksItem;

  @override
  String toString() {
    return 'SellRouteArgs{key: $key, stocksItem: $stocksItem}';
  }
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TermsOfUseScreen]
class TermsOfUseRoute extends PageRouteInfo<void> {
  const TermsOfUseRoute({List<PageRouteInfo>? children})
      : super(
          TermsOfUseRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermsOfUseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
