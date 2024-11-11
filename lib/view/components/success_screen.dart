import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce/src/components.dart';
import 'package:ecommerce/src/config.dart';
import 'package:ecommerce/src/providers.dart';

class SuccessScreen extends ConsumerStatefulWidget {
  final String infoText;
  final String? successText;
  final Widget newPage;
  final String navigateButtonText;
  const SuccessScreen(
      {super.key,
      required this.infoText,
      this.successText,
      required this.newPage,
      required this.navigateButtonText});

  @override
  ConsumerState<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends ConsumerState<SuccessScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(const Duration(seconds: 2), () {
    //   setState(() {
    //     showLoader = true;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    var themeMode = ref.watch(themeViewModel).themeMode;
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: 15.w,
          right: 15.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  AppImages.success,
                  // width: 40,
                  width: 265.w,
                  height: 155.h,
                ),
              ],
            ),
            Gap(
              20.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: widget.successText ?? successText,
                  fontSize: 22.spMin,
                  fontFamily: ttHoves,
                  fontWeight: FontWeight.w600,
                ),
                TextView(
                  text: widget.infoText,
                  fontSize: 15.spMin,
                  fontFamily: ttHoves,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400,
                  color: themeMode == ThemeMode.light ? AppColors.kSubText : AppColors.kHintText,
                ),
              ],
            ),
            Gap(
              45.h,
            ),
            DefaultButtonMain(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
              text: widget.navigateButtonText,
              borderRadius: 40.r,
              color: AppColors.kPrimary1,
              // buttonState: provider.buttonRegisterState!.buttonState,
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  // the new route
                  MaterialPageRoute(
                    builder: (BuildContext context) => widget.newPage,
                  ),

                  // this function should return true when we're done removing routes
                  // but because we want to remove all other screens, we make it
                  // always return false
                  (Route route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
