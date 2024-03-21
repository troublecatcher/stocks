import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks/features/game/logic/bankrupt/bankrupt_cubit.dart';
import 'package:stocks/features/game/ui/home/pages/home_page.dart';
import 'package:stocks/features/game/ui/home/pages/shop_page.dart';
import 'package:stocks/features/game/ui/shared/dialog/variations/dialog_restart.dart';
import 'package:stocks/features/game/ui/home/layout/page_cubit.dart';
import 'package:stocks/features/game/ui/shared/appbar/widget/balance.dart';
import 'package:stocks/features/game/ui/shared/appbar/button/home_button.dart';
import 'package:stocks/features/game/ui/shared/appbar/button/settings_button.dart';
import 'package:stocks/features/game/ui/shared/appbar/button/shop_button.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AfterLayoutMixin<HomeScreen> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 71.h,
        title: BlocBuilder<PageCubit, int>(
          builder: (context, state) {
            return Row(
              children: [
                const SettingsButton(),
                SizedBox(width: 8.w),
                state == 0 ? const ShopButton() : const HomeButton(),
              ],
            );
          },
        ),
        actions: const [BalanceIndicator()],
      ),
      body: BlocListener<PageCubit, int>(
        listener: (context, state) => pageController.animateToPage(state,
            duration: const Duration(milliseconds: 200), curve: Curves.easeOut),
        child: SafeArea(
          bottom: false,
          child: PageView(
            onPageChanged: (value) => context.read<PageCubit>().set(value),
            controller: pageController,
            children: const [
              HomePage(),
              ShopPage(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    if (context.read<BankruptCubit>().isBankrupt()) {
      DialogRestart().showDialog(context);
    }
  }
}
