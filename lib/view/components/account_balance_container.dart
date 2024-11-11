import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce/src/config.dart';
import 'package:ecommerce/src/utils.dart';
import 'package:ecommerce/view/components/button.dart';
import 'package:ecommerce/view/components/custom_text.dart';
import 'package:ecommerce/view_model/theme_view_model.dart';

class AccountBalanceContainer extends ConsumerWidget {
  const AccountBalanceContainer({
    super.key,
    required this.screenWidth,
    required this.accountBalanceButtonWidth,
    required this.usersAccountBalance,
    required this.actionText,
    required this.onTap,
    this.role,
  });

  final double screenWidth;
  final double accountBalanceButtonWidth;
  final String usersAccountBalance;
  final String actionText;
  final VoidCallback onTap;
  final int? role;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var themeMode = ref.watch(themeViewModel).themeMode;
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 15.h,
      ),
      // height: 110.h,
      width: screenWidth.w,
      decoration: BoxDecoration(
        color: themeMode == ThemeMode.dark ? theme.cardColor : theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(
          8.r,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            text: balance,
            fontFamily: ttHoves,
            fontSize: 12.spMin,
            fontWeight: FontWeight.w400,
            color: AppColors.kWhite,
                
          ),
          TextView(
            text:
                "${UtilFunctions.currency(context)} ${UtilFunctions.formatAmount(double.parse(usersAccountBalance.toString()))}",
            // text: ,
            fontSize: 21.spMin,
            fontWeight: FontWeight.w600,
            fontFamily: ttHoves,
            color: AppColors.kWhite,
          ),
          if (role == 3 || role == 2)
            const SizedBox.shrink()
          else
            Align(
              alignment: Alignment.bottomRight,
              child: DefaultButtonMain(
                fontSize: 12.spMin, fontWeight: FontWeight.bold,
                height: 30.h,
                width: 80.w, //Adjust this width
                text: actionText,
                borderRadius: 40.r,
                color: AppColors.kPrimary1,
                // buttonState: provider.buttonRegisterState!.buttonState,
                onPressed: onTap,
                textColor: AppColors.kWhite,
              ),
            ),
        ],
      ),
    );
  }
}
