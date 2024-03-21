import 'package:auto_route/auto_route.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks/features/game/logic/bankrupt/bankrupt_cubit.dart';
import 'package:stocks/features/game/ui/shared/dialog/variations/dialog_restart.dart';
import 'package:stocks/theme/theme/const.dart';

abstract class Dialog {
  void buildDialog(BuildContext context,
      {required List<Widget> children,
      required String title,
      bool closeButtonDoublePop = true,
      bool showCloseIcon = true}) {
    AwesomeDialog(
      dialogBorderRadius: BorderRadius.circular(10.sp),
      dialogBackgroundColor: c100,
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.noHeader,
      body: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          children: [
            if (showCloseIcon)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 8,
                    child: Text(title),
                  ),
                  Expanded(
                    flex: 2,
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        context.router.popForced();
                        if (closeButtonDoublePop) {
                          context.router.popForced();
                        }
                        if (context.read<BankruptCubit>().isBankrupt()) {
                          DialogRestart().showDialog(context);
                        }
                      },
                      child: Container(
                        width: 44.sp,
                        height: 44.sp,
                        decoration: const BoxDecoration(
                          color: c300,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.close,
                          color: c100,
                          size: 40.sp,
                        ),
                      ),
                    ),
                  )
                ],
              )
            else
              Text(title),
            ...children,
          ],
        ),
      ),
      dismissOnTouchOutside: false,
    ).show();
  }
}

enum Transaction {
  sell('sold'),
  buy('bought');

  final String word;

  const Transaction(this.word);
}
