import 'package:ecommerce/view/screens/signup/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce/src/components.dart';
import 'package:ecommerce/src/config.dart';
import 'package:ecommerce/src/providers.dart';
import 'package:ecommerce/src/utils.dart';
import 'package:ecommerce/src/screens.dart';

class OnboardingScreen extends ConsumerWidget {
  final bool? showBackButton;
  const OnboardingScreen({super.key, this.showBackButton = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(themeViewModel).themeMode;
    var theme = Theme.of(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              AppImages.onboarding2BackgroungImage,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: 30.h,
            top: 50.h,
            left: 20.w,
            right: 20.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  showBackButton == true
                      ? Align(
                          alignment: Alignment.bottomLeft,
                          child: InkWell(
                              onTap: () {
                                navigateBack(context);
                              },
                              child: Container(
                                height: 45.h,
                                width: 45.w,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.kBlack4.withOpacity(0.35)),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 5.w),
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      size: 20.spMin,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )),
                        )
                      : Container(),
                  Image.asset(
                    AppImages.logo,
                    height: 250.h,
                    width: 270.w,
                  ),
                ],
              ),
              SizedBox(
                // height: 100.h,
                width: 320.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextView(
                      text: welcomeToXamp,
                      textAlign: TextAlign.center,
                      textStyle: theme.textTheme.headlineSmall,
                      maxLines: 2,
                    ),
                    TextView(
                      text: accountDetails,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      textStyle: theme.textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              SizedBox(
                // height: 155.h,
                width: 380.w,
                child: Column(
                  children: [
                    DefaultButtonMain(
                      borderRadius: 38.r,
                      onPressed: () => navigatePush(
                        context,
                        const CreateAccountScreen(),
                      ),
                      color: AppColors.kPrimary1,
                      height: 48.h,
                      // width: 380.w,
                      text: createAccount,
                      textColor: AppColors.kWhite,
                      fontSize: 16.spMin,
                      fontWeight: FontWeight.w500,
                      fontFamily: ttHoves,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    DefaultButtonMain(
                      borderRadius: 38.r,
                      onPressed: () => navigatePush(
                        context,
                        const SignInScreen(
                          backBtnVisibility: true,
                        ),
                      ),
                      color: AppColors.kWhite,
                      height: 48.h,
                      // width: 380.w,
                      text: login,
                      textColor: AppColors.kTextBlack,
                      fontSize: 16.spMin,
                      fontWeight: FontWeight.w500,
                      fontFamily: ttHoves,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 24.w),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       TextView(
                    //         text: privacyPolicy,
                    //         color: AppColors.kWhite,
                    //         fontSize: 16.spMin,
                    //         fontWeight: FontWeight.w500,
                    //         fontFamily: ttHoves,
                    //       ),
                    //       TextView(
                    //         text: termsOfService,
                    //         color: AppColors.kWhite,
                    //         fontSize: 16.spMin,
                    //         fontWeight: FontWeight.w500,
                    //         fontFamily: ttHoves,
                    //       ),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
