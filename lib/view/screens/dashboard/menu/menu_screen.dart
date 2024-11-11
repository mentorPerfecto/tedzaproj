// ignore_for_file: use_build_context_synchronously

import 'package:ecommerce/view/screens/signup/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rebirth/rebirth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerce/model/local/dummy_data.dart';
import 'package:ecommerce/src/components.dart';
import 'package:ecommerce/src/config.dart';
import 'package:ecommerce/src/providers.dart';
import 'package:ecommerce/src/screens.dart';
import 'package:ecommerce/src/utils.dart';


class MenuScreen extends ConsumerStatefulWidget {
  const MenuScreen({super.key});

  @override
  ConsumerState<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends ConsumerState<MenuScreen> {


  @override
  void didChangeDependencies() {
    var profileProvider =  ref.watch(profileViewModel);
    Future.microtask((){
      profileProvider.loadData(context);
    });
    super.didChangeDependencies();
  }


  bool isLogOutLoading = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = ((MediaQuery.sizeOf(context).width) - 20);
    var profileProvider = ref.watch(profileViewModel);
    ref.watch(dashboardViewModel);
    var themeProvider = ref.watch(themeViewModel).themeMode;
    var theme = Theme.of(context);
    return Scaffold(
        backgroundColor: AppColors.kTransparent,
        body: XResponsiveWrap.mobile(
          onRefresh: () async {
            await profileProvider.loadData(context);
          },
          backgroundColor: AppColors.kTransparent,
          //loadFailed: profileProvider.profileData != null,
          children: [
            SizedBox(
              height: 20.h,
            ),
            UserAccountDetails(
                screenWidth: screenWidth,
                accountType: profileProvider.profileData?.role.toString() ?? "",
                name: profileProvider.profileData?.name ?? '',
                profilePicture:
                    profileProvider.profileData?.avatar.toString()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: const XampDivider(),
            ),
            SizedBox(height: 18.h),

            Container(
              width: screenWidth,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                // color: themeProvider == ThemeMode.light ? AppColors.kBackground : theme.cardColor,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: const SettingsThemeItem(
                logo: AppImages.moonSetting,
                title: darkMode,

                // onTap: () {
                //   themeProvider.setThemeMode(ThemeMode.dark);
                // },
              ),
            ),

            SizedBox(height: 18.h),
            Container(
              // height: 130.h,
              width: screenWidth,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                // color: themeProvider == ThemeMode.light ? AppColors.kBackground : theme.cardColor,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SettingsItem(
                    logo: AppImages.faq,
                    onTap: () {
                      navigatePush(context, const AccountSettingScreen());
                    },
                    title: "Account Settings",
                    titleColor: themeProvider == ThemeMode.light
                        ? AppColors.kTextBlack
                        : AppColors.kWhite,
                    logoColor: themeProvider == ThemeMode.light
                        ? AppColors.kIcon
                        : AppColors.kPrimary150,
                  ),
                ],
              ),
            ),

            SizedBox(height: 18.h),
          isLogOutLoading
                    ? const Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator())
                    : Container(
                        width: screenWidth,
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        decoration: BoxDecoration(
                          // color: themeProvider == ThemeMode.light
                          //     ? AppColors.kBackground
                          //     : theme.cardColor,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: SettingsItem(
                          onTap: () async {
                            displayLogoutDialog(context,
                                theme: theme,
                                themeMode: themeProvider, onTap: () async {
                              navigateBack(context);
                              setState(() {
                                isLogOutLoading = true;
                              });
                              try {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.remove('Email');
                                await prefs.remove('Password');
                                await prefs.remove('accessToken');
                                DummyData.fullName = '';
                                await Future.delayed(const Duration(seconds: 2));
                                WidgetRebirth.createRebirth(context: context);

                               
                              } catch (e) {
                                setState(() {
                                  isLogOutLoading = false;
                                });
                              }
                            });

                            // showToast(msg: 'Please wait ', isError: false);
                          },
                          logo: AppImages.logOutSetting,
                          title: logOut,
                          titleColor: AppColors.kLogOutText,
                        ),
                      ),
            SizedBox(height: 18.h),
          ],
        ));
  }
}

class SettingsItem extends StatelessWidget {
  const SettingsItem(
      {super.key,
      required this.logo,
      required this.title,
      this.titleColor,
      this.onTap,
      this.logoColor});
  final String title;
  final String logo;
  final Color? titleColor;
  final VoidCallback? onTap;
  final Color? logoColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // height: 40.h,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        // color: Colors.red,

        width: double.infinity,
        child: Row(
          children: [
            Image.asset(
              logo,
              width: 24.w,
              height: 24.h,
              color: logoColor,
            ),
            SizedBox(
              width: 10.w,
            ),
            TextView(
              onTap: onTap,
              text: title,
              fontSize: 16.spMin,
              fontWeight: FontWeight.w500,
              fontFamily: ttHoves,
              color: titleColor,
            )
          ],
        ),
      ),
    );
  }
}

class SettingsThemeItem extends ConsumerStatefulWidget {
  const SettingsThemeItem({
    super.key,
    required this.logo,
    required this.title,
    this.onTap,
  });
  final String title;
  final String logo;

  final VoidCallback? onTap;
  @override
  ConsumerState<SettingsThemeItem> createState() => _SettingsThemeItemState();
}

class _SettingsThemeItemState extends ConsumerState<SettingsThemeItem> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = ref.watch(themeViewModel);
    return InkWell(
      onTap: widget.onTap,
      child: SizedBox(
        height: 40.h,
        // color: Colors.red,

        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  widget.logo,
                  width: 24.w,
                  height: 24.h,
                  color: themeProvider.themeMode == ThemeMode.light
                      ? AppColors.kIcon
                      : AppColors.kPrimary150,
                ),
                SizedBox(
                  width: 10.w,
                ),
                TextView(
                  onTap: widget.onTap,
                  text: widget.title,
                  fontSize: 16.spMin,
                  fontWeight: FontWeight.w500,
                  fontFamily: ttHoves,
                  color: themeProvider.themeMode == ThemeMode.light
                      ? AppColors.kTextBlack
                      : AppColors.kWhite,
                )
              ],
            ),
            ListenableBuilder(
                listenable: themeProvider,
                builder: (BuildContext context, Widget? child) {
                  final themeMode = themeProvider.themeMode;

                  return CupertinoSwitch(
                    value: themeMode == ThemeMode.dark,
                    onChanged: (value) async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      if (value) {
                        themeProvider.setThemeMode(ThemeMode.dark);
                        prefs.setBool('isDarkTheme', true);
                        return;
                      }
                      themeProvider.setThemeMode(ThemeMode.light);
                      prefs.setBool('isDarkTheme', false);
                    },
                    activeColor: themeMode == ThemeMode.light
                        ? AppColors.kPrimary1
                        : AppColors.kPrimary150,
                  );
                })
          ],
        ),
      ),
    );
  }
}

// class AccountVerification extends ConsumerWidget {
//   const AccountVerification({
//     super.key,
//     required this.screenWidth,
//   });
//
//   final double screenWidth;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var profileProvider = ref.watch(profileViewModel);
//     var themeMode = ref.watch(themeViewModel).themeMode;
//     var theme = Theme.of(context);
//
//     return SizedBox(
//         // child: profileProvider.kycResponseStatus?.data?.status.toString().toUpperCase() == "REJECTED"
//         //     ?
//         child: Column(
//       children: [
//         Gap(30.h),
//         Container(
//           // height: 60.h,
//           width: screenWidth,
//           padding: EdgeInsets.symmetric(
//             vertical: 8.h,
//             horizontal: 12.w,
//           ),
//           decoration: BoxDecoration(
//             color: themeMode == ThemeMode.light
//                 ? AppColors.kPrimaryLight
//                 : theme.cardColor,
//             borderRadius: BorderRadius.circular(
//               16.r,
//             ),
//           ),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   TextView(
//                     text: "Account Verification",
//                     fontSize: 14.spMin,
//                     fontWeight: FontWeight.w600,
//                     fontFamily: ttHoves,
//                   ),
//                   SizedBox(
//                     height: 2.h,
//                   ),
//                   TextView(
//                     text: "Complete account verification",
//                     fontSize: 11.spMin,
//                     fontWeight: FontWeight.w400,
//                     fontFamily: ttHoves,
//                   ),
//                 ],
//               ),
//               TextView(
//                 text: profileProvider.kycResponseStatus?.data?.status
//                             .toString()
//                             .toUpperCase() ==
//                         "REJECTED"
//                     ? continueText
//                     : profileProvider.kycResponseStatus?.data?.status
//                             .toString()
//                             .toUpperCase() ??
//                         continueText,
//                 onTap: () {
//                   if (profileProvider.kycResponseStatus?.data?.status
//                           .toString() ==
//                       "REJECTED") {
//                     navigatePush(context, const IdentificationScreen());
//                   } else if (profileProvider.kycResponseStatus?.data == null) {
//                     navigatePush(context, const IdentificationScreen());
//                   }
//                 },
//                 fontSize: 14.spMin,
//                 fontWeight: FontWeight.w500,
//                 fontFamily: ttHoves,
//                 color: AppColors.kYellowDeep,
//               )
//             ],
//           ),
//         ),
//       ],
//     )
//         // : Container(),
//         );
//   }
// }

class UserAccountDetails extends ConsumerWidget {
  const UserAccountDetails(
      {super.key,
      required this.screenWidth,
      required this.accountType,
      required this.name,
      required this.profilePicture});

  final double screenWidth;
  final String accountType;
  final String name;
  final String? profilePicture;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var themeMode = ref.watch(themeViewModel).themeMode;
    var profileProvider = ref.watch(profileViewModel);
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 8.h,
      ),
      width: screenWidth,
      // height: 76.h,
      decoration: BoxDecoration(
        // color: themeMode == ThemeMode.light ? AppColors.kBackground : theme.cardColor,
        borderRadius: BorderRadius.circular(
          16.r,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //
          SizedBox(
            // width: 172.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // CircleAvatar(
                //   radius: 24.r,
                //   backgroundImage: NetworkImage(profilePicture),
                // ),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: ProfileImage(
                    imageType: ProfileImageType.user,
                    imageUrl: profilePicture,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextView(
                      text: UtilFunctions.capitalizeAllWord(name),
                      fontSize: 14.spMin,
                      fontWeight: FontWeight.w600,
                      fontFamily: ttHoves,
                      color: themeMode == ThemeMode.light
                          ? AppColors.kTextBlack
                          : AppColors.kWhite,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextView(
                      text:  UtilFunctions.capitalizeAllWord(accountType),
                      fontSize: 11.spMin,
                      fontWeight: FontWeight.w400,
                      fontFamily: ttHoves,
                      color: themeMode == ThemeMode.light
                          ? AppColors.kTextBlack
                          : AppColors.kWhite,
                    ),
                  ],
                )
              ],
            ),
          ),

          DummyData.accessToken.toString() == 'null'
              ? Container()
              : Column(
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

class AccountType extends StatelessWidget {
  const AccountType({
    super.key,
    required this.isSelected,
    required this.tenantOnTap,
    required this.logo,
    required this.title,
  });
  final bool isSelected;
  final VoidCallback tenantOnTap;
  final String logo;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.kPrimaryLight,
                child: Center(
                  child: Image.asset(
                    logo,
                    width: 20.w,
                    height: 20.h,
                    color: AppColors.kIcon,
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              TextView(
                text: title,
                fontSize: 16.spMin,
                fontWeight: FontWeight.w500,
                fontFamily: ttHoves,
                color: AppColors.kTextBlack,
              )
            ],
          ),
          InkWell(
            onTap: tenantOnTap,
            child: Container(
              height: 16.h,
              width: 16.w,
              decoration: BoxDecoration(
                color: AppColors.kWhite,
                border: Border.all(
                  color: isSelected ? AppColors.kPrimary1 : AppColors.kGrey300,
                  width: 1.3.w,
                ),
                borderRadius: BorderRadius.circular(
                  8.r,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: CircleAvatar(
                        radius: 5.r,
                        backgroundColor: AppColors.kPrimary1,
                      ),
                    )
                  : null,
            ),
          )
        ],
      ),
    );
  }
}
