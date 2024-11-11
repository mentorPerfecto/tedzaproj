import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/config/app_colors.dart';
import 'package:ecommerce/src/components.dart';

class SuccessLoadingScreen extends ConsumerStatefulWidget {
  final String informationText;
  final String? detailText;
  const SuccessLoadingScreen(
      {required this.informationText, this.detailText, super.key});

  @override
  ConsumerState<SuccessLoadingScreen> createState() =>
      _SuccessLoadingScreenState();
}

class _SuccessLoadingScreenState extends ConsumerState<SuccessLoadingScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: 45.h,
                width: 45.h,
                child: CircularProgressIndicator(
                  color: AppColors.kGreenLoader,
                  backgroundColor: AppColors.kGreenLoader.withOpacity(0.1),
                  strokeWidth: 6,
                ),
              ),
            ),
            Gap(15.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextView(
                  text: widget.informationText,
                  fontWeight: FontWeight.w600,
                  fontSize: 22.spMin,
                ),
                TextView(
                  text: widget.detailText ?? '',
                  fontWeight: FontWeight.w400,
                  fontSize: 14.spMin,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ),
              ],
            )
          ],
        ));
  }
}
