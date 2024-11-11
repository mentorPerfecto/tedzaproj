import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/config/app_colors.dart';
import 'package:ecommerce/config/app_strings.dart';
import 'package:ecommerce/src/utils.dart';

import 'custom_text.dart';

class DateDifferenceCard extends ConsumerStatefulWidget {
  final String startDate;
  final String endDate;

  const DateDifferenceCard({super.key, required this.startDate, required this.endDate});

  @override
  ConsumerState<DateDifferenceCard > createState() => _DateDifferenceCardState();
}

class _DateDifferenceCardState extends ConsumerState<DateDifferenceCard > {


  @override
  Widget build(BuildContext context) {
    return  Container(
      // width: 67.w,
      height: 22.h,
      padding: EdgeInsets.symmetric(
        horizontal: 7.w,
      ),
      decoration: BoxDecoration(
          color:  UtilFunctions.formatDateDifferenceInWords(widget.startDate, widget.endDate).value <= 0 ?  AppColors.kErrorPrimary.withOpacity(0.1) :
          UtilFunctions.formatDateDifferenceInWords(widget.startDate, widget.endDate).value <= 100
              ? AppColors.kYellow300.withOpacity(0.1)
              : AppColors.kGreen.withOpacity(0.1),
          borderRadius: BorderRadius.circular(40.r)),
      child: Center(
          child: TextView(
            text: UtilFunctions.formatDateDifferenceInWords(widget.startDate, widget.endDate).title,
            fontFamily: ttHoves,
            fontSize: 10.spMin,
            fontWeight: FontWeight.bold,
            color:UtilFunctions.formatDateDifferenceInWords(widget.startDate, widget.endDate).value <= 0 ?  AppColors.kErrorPrimary :
            UtilFunctions.formatDateDifferenceInWords(widget.startDate, widget.endDate).value <= 100
                ? AppColors.kYellow300
                : AppColors.kGreen,
          ) ),
    );
  }
}
