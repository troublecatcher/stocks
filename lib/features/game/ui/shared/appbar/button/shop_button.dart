import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stocks/features/game/ui/home/layout/page_cubit.dart';
import 'package:stocks/theme/theme/const.dart';
import 'package:stocks/theme/shared/button/custom_icon_button.dart';

class ShopButton extends StatelessWidget {
  const ShopButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: SvgPicture.asset('assets/icons/shop.svg'),
      onPressed: () => context.read<PageCubit>().inc(),
      color: c500,
    );
  }
}
