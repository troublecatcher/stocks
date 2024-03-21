import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stocks/features/game/logic/balance/balance_cubit.dart';
import 'package:stocks/features/game/logic/bankrupt/bankrupt_cubit.dart';
import 'package:stocks/features/game/ui/home/layout/page_cubit.dart';
import 'package:stocks/features/game/logic/portfolio/portfolio_cubit.dart';
import 'package:stocks/features/game/logic/stocks/stocks_cubit.dart';
import 'package:stocks/init/init_di.dart';
import 'package:stocks/init/init_firebase.dart';
import 'package:stocks/init/init_hive.dart';
import 'package:stocks/router/router.dart';
import 'package:stocks/theme/theme/theme.dart';

bool? isFirstTime;
String? privacyPolicy;
String? termsOfUse;
String? promotion;
Box? stocksBox;
Box? portfolioBox;

final locator = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();
  await initDI();
  await initHive();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => PageCubit()),
      BlocProvider(create: (context) => StocksCubit()),
      BlocProvider(create: (context) => BalanceCubit()),
      BlocProvider(
          create: (context) =>
              PortfolioCubit(balanceCubit: context.read<BalanceCubit>())),
      BlocProvider(
          create: (context) => BankruptCubit(
                stocksCubit: context.read<StocksCubit>(),
                portfolioCubit: context.read<PortfolioCubit>(),
                balanceCubit: context.read<BalanceCubit>(),
              )),
    ],
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          theme: theme,
          routerConfig: _appRouter.config(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
