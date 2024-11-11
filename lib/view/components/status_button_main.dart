import 'package:flutter/material.dart';
import 'package:ecommerce/src/components.dart';
import 'package:ecommerce/src/config.dart';
import 'package:ecommerce/src/utils.dart';

class StatusButtonMain extends StatelessWidget {
  const StatusButtonMain({
    super.key,
    required this.status,
  });

  final String? status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.r, vertical: 2.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        color: status == "pending"
            ? AppColors.kNeutralYellowForPendingStatusBackground
            : status == "success"
                ? AppColors.kGreenLight :
              status == "unused"
            ?  AppColors.kGrey300
            : AppColors.kErrorContainer,
      ),
      child: TextView(
        text: UtilFunctions.capitalizeAllWord(status.toString()),
        fontFamily: ttHoves,
        fontSize: 11.spMin,
        fontWeight: FontWeight.w500,
        color: status == "pending"
            ? AppColors.kPendingStatusColor
            : status == "success"
                ? AppColors.kGreen
                : status == "unused"
            ?  AppColors.kGrey
            :
        AppColors.kErrorPrimary1,
      ),
    );
  }
}
