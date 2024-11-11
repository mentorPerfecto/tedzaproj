// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce/src/config.dart';
import 'package:ecommerce/src/providers.dart';

class DropDownButtonMain extends ConsumerWidget {
  DropDownButtonMain({
    super.key,
    required this.title,
    required this.hintText,
    required this.onTap,
    required this.items,
    this.colour,
    this.titleSize,
    this.titleWeight,
  });
  String hintText;
  String? title;
  double? titleSize;
  FontWeight? titleWeight;
  Color? colour;
  List<DropdownMenuItem<String>>? items;
  Function(String? value) onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Theme.of(context);
    ThemeMode themeMode = ref.watch(themeViewModel).themeMode;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.spMin, vertical: 4.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(
          color: themeMode == ThemeMode.light
              ? AppColors.kDisabledButton
              : AppColors.kDarkSecondary,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
            isExpanded: true,
            hint: Text(
              hintText,
              style: TextStyle(
                  color: themeMode == ThemeMode.light
                      ? AppColors.kTextBlack
                      : AppColors.kWhite),
            ),
            value: title,
            icon: Image.asset(
              AppImages.dropDown,
              color: themeMode == ThemeMode.light
                  ? AppColors.kTextBlack
                  : AppColors.kWhite,
              width: 24.w,
              height: 24.h,
            ),
            style: TextStyle(
                color: themeMode == ThemeMode.light
                    ? AppColors.kTextBlack
                    : AppColors.kWhite),
            onChanged: onTap,
            items: items),
      ),
    );
  }
}
