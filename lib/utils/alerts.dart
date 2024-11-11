import 'package:flutter/material.dart';
import 'package:ecommerce/src/components.dart';
import 'package:ecommerce/src/config.dart';
import 'package:ecommerce/src/utils.dart';

//1
Future<void> displayDeleteConfirmationMessageAlert(
  BuildContext context,
  String title, {
  required String message,
  required bool isDismissible,
  VoidCallback? onTap,
  required ThemeMode themeMode,
  required ThemeData theme,
  // btnOneText,
}) async {
  final width = MediaQuery.sizeOf(context).width;
  showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: themeMode == ThemeMode.light ? AppColors.kWhite : theme.cardColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            height: 350.h,
            // height: deviceH / 3,
            width: width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextView(
                      text: title,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.spMin,
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    TextView(
                      text: message,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      maxLines: 5,
                      fontSize: 16.spMin,
                    ),
                    SizedBox(
                      height: 26.h,
                    ),

                    DefaultButtonMain(
                      color: AppColors.kPrimary1,
                      width: 200.w,
                      text: continueText,
                      borderColor: AppColors.kPrimary1,
                      borderRadius: 38.r,
                      height: 48.h,
                      onPressed: onTap,
                    ),
                    // buttonConfirmation(
                    //     onPressed: () {
                    //       navigateBack(context);
                    //       navigatePush(context, EditAccountDetailsScreen());
                    //     },
                    //     text: continueText),
                    SizedBox(
                      height: 10.h,
                    ),

                    DefaultButtonMain(
                      width: 200.w,
                      text: back,
                      color: themeMode == ThemeMode.light ? AppColors.kWhite : theme.cardColor,
                      borderColor: theme.colorScheme.primary,
                      borderRadius: 38.r,
                      textColor: theme.colorScheme.primary,
                      height: 48.h,
                      onPressed: () {
                        navigateBack(context);
                      },
                    ),
                    // buttonConfirmation(
                    //     onPressed: () {
                    //       navigateBack(context);
                    //     },
                    //     text: back,
                    //     gradient: AppColors.white900Gradient,
                    //     textColor: Colors.black)
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

Future<void> displayFreezingListingConfirmationMessage(
  BuildContext context,
  String title, {
  required String message,
  required bool isDismissible,
  VoidCallback? onTap,
  required ThemeMode themeMode,
  required ThemeData theme,
  // btnOneText,
}) async {
  final width = MediaQuery.sizeOf(context).width;
  showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: themeMode == ThemeMode.light ? AppColors.kWhite : theme.cardColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            // height: deviceH / 3,
            width: width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 48.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28.r),
                        color: AppColors.kEnabledButton,
                      ),
                      child: Center(
                        child: Image.asset(
                          AppImages.freezingListingIcon,
                        ),
                      ),
                    ),
                    Gap(20.h),
                    TextView(
                      text: title,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.spMin,
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    TextView(
                      text: message,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      maxLines: 5,
                      fontSize: 16.spMin,
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    Row(
                      children: [
                        DefaultButtonMain(
                          color: theme.scaffoldBackgroundColor,
                          text: "Cancel",
                          borderColor: AppColors.kGrey300,
                          textColor: theme.colorScheme.primary,
                          borderRadius: 8.r,
                          padding: EdgeInsets.symmetric(
                            vertical: 12.h,
                            horizontal: 12.w,
                          ),
                          onPressed: () {
                            navigateBack(context);
                          },
                        ),
                        SizedBox(
                          width: 15.h,
                        ),
                        DefaultButtonMain(
                          text: "Continue",
                          color: themeMode == ThemeMode.light
                              ? AppColors.kPrimary1
                              : AppColors.kPrimary1Dark,
                          borderRadius: 8.r,
                          textColor: theme.scaffoldBackgroundColor,
                          padding: EdgeInsets.symmetric(
                            vertical: 12.h,
                            horizontal: 12.w,
                          ),
                          onPressed: (){
                            navigateBack(context);
                            onTap!();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

//2
Future<void> displayDeleteUserProfileConfirmationMessageAlert(
  BuildContext context,
  String title, {
  required bool isDismissible,
  VoidCallback? onTap,
  required ThemeData theme,
  required ThemeMode themeMode,
  // btnOneText,
}) async {
  final width = MediaQuery.sizeOf(context).width;
  final deviceH = MediaQuery.sizeOf(context).height;
  showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: themeMode == ThemeMode.dark ? theme.cardColor : AppColors.kWhite,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            height: (deviceH / 1.65).h,
            //height: getAlertDialogHeight(),
            // height: deviceH / 3,
            width: width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextView(
                      text: title,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.spMin,
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextView(
                          text: deleteAccntText,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.spMin,
                          maxLines: 3,
                          fontFamily: ttHoves,
                        ),
                        SizedBox(height: 16.0.h),
                        TextView(
                          text: deleteAccntConsequenceText,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.spMin,
                          maxLines: 3,
                          fontFamily: ttHoves,
                        ),
                        SizedBox(height: 8.0.h),
                        TextView(
                          text: lossOfAccntData,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.spMin,
                          maxLines: 3,
                          fontFamily: ttHoves,
                        ),
                        TextView(
                          text: inabilityToRecoverAccntInformation,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.spMin,
                          maxLines: 3,
                          fontFamily: ttHoves,
                        ),
                        SizedBox(height: 16.0.h),
                        TextView(
                          text: ireversibleActionText,
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.spMin,
                          maxLines: 4,
                          fontFamily: ttHoves,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 26.h,
                    ),

                    DefaultButtonMain(
                      color: AppColors.kPrimary1,
                      width: 200.w,
                      text: continueText,
                      borderColor: AppColors.kPrimary1,
                      borderRadius: 38.r,
                      height: 48.h,
                      onPressed: onTap,
                    ),
                    // buttonConfirmation(
                    //     onPressed: () {
                    //       navigateBack(context);
                    //       navigatePush(context, EditAccountDetailsScreen());
                    //     },
                    //     text: continueText),
                    SizedBox(
                      height: 10.h,
                    ),

                    DefaultButtonMain(
                      width: 200.w,
                      text: back,
                      color: themeMode == ThemeMode.light ? AppColors.kWhite : theme.cardColor,
                      borderColor: theme.colorScheme.primary,
                      borderRadius: 38.r,
                      textColor: theme.colorScheme.primary,
                      height: 48.h,
                      onPressed: () {
                        navigateBack(context);
                      },
                    ),
                    // buttonConfirmation(
                    //     onPressed: () {
                    //       navigateBack(context);
                    //     },
                    //     text: back,
                    //     gradient: AppColors.white900Gradient,
                    //     textColor: Colors.black)
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

//3
Future<void> displayValidatePasswordAlert(
  BuildContext context, {
  required VoidCallback onTap,
  required TextEditingController passwordController,
  required bool obscureInput,
  required String actionText,
  final void Function()? onObscureText,
  required ThemeMode themeMode,
  required ThemeData theme,
}) async {
  final width = MediaQuery.of(context).size.width;
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (ctx) {
      return AlertDialog(
        backgroundColor: themeMode == ThemeMode.light ? Colors.white : theme.cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: EdgeInsets.zero,
        content: SizedBox(
          height: 320.h,
          width: width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.w),
            child: Column(
              children: [
                TextView(
                  text: enterPwd,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.spMin,
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomTextField(
                  fieldLabel: '',
                  hint: password,
                  password: true,
                  validator: (value) => Validators().validateEmptyTextField(value),
                  controller: passwordController,
                  obscureInput: obscureInput,
                  showSuffixIcon: false,
                  onObscureText: onObscureText,
                ),
                SizedBox(
                  height: 26.h,
                ),
                DefaultButtonMain(
                  color: AppColors.kErrorPrimary,
                  width: 200.w,
                  text: actionText,
                  borderColor: AppColors.kErrorPrimary,
                  borderRadius: 38.r,
                  height: 48.h,
                  onPressed: onTap,
                ),
                SizedBox(
                  height: 10.h,
                ),
                DefaultButtonMain(
                  width: 200.w,
                  text: cancel,
                  color: themeMode == ThemeMode.light ? AppColors.kWhite : theme.cardColor,
                  borderColor: theme.colorScheme.primary,
                  borderRadius: 38.r,
                  textColor: theme.colorScheme.primary,
                  height: 48.h,
                  onPressed: () {
                    navigateBack(context);
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

//4
Future<void> displayRentConfirmationMessageAlert(
  BuildContext context,
  String title, {
  required String message,
  required bool isDismissible,
  VoidCallback? onTap,
  required ThemeMode themeMode,
  required ThemeData theme,
  // btnOneText,
}) async {
  final width = MediaQuery.sizeOf(context).width;
  showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: themeMode == ThemeMode.light ? Colors.white : theme.cardColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            // height: 350.h,
            // height: deviceH / 3,
            width: width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextView(
                      text: title,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.spMin,
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    RichText(
                      text: TextSpan(
                        text: willingToPayText,
                        style: TextStyle(
                            color: themeMode == ThemeMode.light ? Colors.black : AppColors.kWhite,
                            fontSize: 16.spMin,
                            fontFamily: ttHoves,
                            fontWeight: FontWeight.w400),
                        children: <TextSpan>[
                          TextSpan(
                            text: message,
                            style: TextStyle(fontSize: 16.spMin, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),

                    // TextView(
                    //   text: message,
                    //   fontWeight: FontWeight.w400,
                    //   textAlign: TextAlign.center,
                    //   maxLines: 5,
                    //   fontSize: 16.spMin,
                    // ),
                    SizedBox(
                      height: 26.h,
                    ),

                    DefaultButtonMain(
                      color: AppColors.kPrimary1,
                      width: 200.w,
                      text: continueText,
                      borderColor: AppColors.kPrimary1,
                      borderRadius: 38.r,
                      height: 48.h,
                      onPressed: onTap,
                    ),
                    // buttonConfirmation(
                    //     onPressed: () {
                    //       navigateBack(context);
                    //       navigatePush(context, EditAccountDetailsScreen());
                    //     },
                    //     text: continueText),
                    SizedBox(
                      height: 10.h,
                    ),

                    DefaultButtonMain(
                      width: 200.w,
                      text: back,
                      color: themeMode == ThemeMode.light ? AppColors.kWhite : theme.cardColor,
                      borderColor: theme.colorScheme.primary,
                      borderRadius: 38.r,
                      textColor: theme.colorScheme.primary,
                      height: 48.h,
                      onPressed: () {
                        navigateBack(context);
                      },
                    ),
                    // buttonConfirmation(
                    //     onPressed: () {
                    //       navigateBack(context);
                    //     },
                    //     text: back,
                    //     gradient: AppColors.white900Gradient,
                    //     textColor: Colors.black)
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

Future<void> displayUnverifiedPropertyWarningAlert(
  BuildContext context, {
  VoidCallback? onTap,
  required ThemeMode themeMode,
  required ThemeData theme,
  // btnOneText,
}) async {
  final width = MediaQuery.sizeOf(context).width;
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: themeMode == ThemeMode.light ? Colors.white : theme.cardColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            // height: deviceH / 3,
            width: width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      AppImages.warningIcon,
                      width: 64.w,
                      height: 64.h,
                    ),
                    Gap(20.h),
                    Column(
                      children: [
                        TextView(
                          text: warningText,
                          fontSize: 22.spMin,
                          fontWeight: FontWeight.w600,
                          fontFamily: ttHoves,
                        ),
                        Gap(10.h),
                        TextView(
                          text: unverifiedPrprty,
                          fontSize: 15.spMin,
                          fontWeight: FontWeight.w400,
                          fontFamily: ttHoves,
                          color: AppColors.kSubText,
                        ),
                      ],
                    ),
                    Gap(15.h),
                    DefaultButtonMain(
                      color: themeMode == ThemeMode.light
                          ? AppColors.kPrimary1
                          : AppColors.kPrimaryDark,
                      width: 360.w,
                      textColor:
                          themeMode == ThemeMode.light ? AppColors.kWhite : AppColors.kTextBlack,
                      text: continueText,
                      borderRadius: 40.r,
                      height: 48.h,
                      onPressed: onTap,
                    ),
                    Gap(10.h),
                    DefaultButtonMain(
                      color: theme.scaffoldBackgroundColor,
                      width: 360.w,
                      textColor: themeMode == ThemeMode.light
                          ? AppColors.kTextBlack
                          : AppColors.kPrimaryDark,
                      text: close,
                      borderRadius: 40.r,
                      borderColor: themeMode == ThemeMode.light
                          ? AppColors.kTextBlack
                          : AppColors.kPrimaryDark,
                      height: 48.h,
                      onPressed: () {
                        navigateBack(context);
                      },
                    ),
                    // buttonConfirmation(
                    //     onPressed: () {
                    //       navigateBack(context);
                    //     },
                    //     text: back,
                    //     gradient: AppColors.white900Gradient,
                    //     textColor: Colors.black)
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

//5
Future<dynamic> displayExitDialog(
  BuildContext context, {
  required ThemeMode themeMode,
  required ThemeData theme,
}) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        backgroundColor: themeMode == ThemeMode.light ? Colors.white : theme.cardColor,
        title: Center(
          child: TextView(
            text: exitApp,
            fontSize: 16.spMin,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: TextView(
          text: sureYouWntToExtApp,
          fontSize: 14.spMin,
          maxLines: 2,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w500,
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: DefaultButtonMain(
                  color: Colors.white,
                  width: 120.w,
                  textColor: AppColors.kPrimary1,
                  text: no,
                  borderColor: AppColors.kPrimary1,
                  borderRadius: 38.r,
                  height: 48.h,
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                child: DefaultButtonMain(
                  color: AppColors.kPrimary1,
                  width: 120.w,
                  text: yes,
                  borderColor: AppColors.kPrimary1,
                  borderRadius: 38.r,
                  height: 48.h,
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ),
            ],
          )
        ],
      );
    },
  );
}

//6
Future<dynamic> addPhotosFromCameraOrGalleryDialog(
  BuildContext context, {
  required VoidCallback cameraOnTap,
  required VoidCallback galleryOnTap,
  required ThemeMode themeMode,
  required ThemeData theme,
}) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        backgroundColor: themeMode == ThemeMode.light ? Colors.white : theme.cardColor,
        // title: Center(
        //   child: TextView(
        //     text: 'Exit App',
        //     fontSize: 16.spMin,
        //     fontWeight: FontWeight.w600,
        //   ),
        // ),
        content: SizedBox(
          height: 100.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextView(
                text: addPhotosFrm,
                fontSize: 18.spMin,
                fontWeight: FontWeight.w500,
              ),
              Gap(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: galleryOnTap,
                    child: Column(
                      children: [
                        Icon(
                          Icons.image,
                          size: 24.spMin,
                          color: themeMode == ThemeMode.light
                              ? AppColors.kPrimary1
                              : AppColors.kPrimary150,
                        ),
                        const Gap(5),
                        TextView(
                          text: gallery,
                          fontSize: 15.spMin,
                          fontWeight: FontWeight.w400,
                          fontFamily: ttHoves,
                        ),
                      ],
                    ),
                  ),
                  const Gap(15),
                  InkWell(
                    onTap: cameraOnTap,
                    child: Column(
                      children: [
                        Icon(
                          Icons.photo_camera,
                          size: 24.spMin,
                          color: themeMode == ThemeMode.light
                              ? AppColors.kPrimary1
                              : AppColors.kPrimary150,
                        ),
                        const Gap(5),
                        TextView(
                          text: camera,
                          fontSize: 15.spMin,
                          fontWeight: FontWeight.w400,
                          fontFamily: ttHoves,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

// //7
// Future<dynamic> displayUnverifiedPropertyDialog(
//   BuildContext context, {
//   required ThemeMode themeMode,
//   required ThemeData theme,
// }) async {
//   return showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
//         backgroundColor:
//             themeMode == ThemeMode.light ? Colors.white : theme.cardColor,
//         // title: Center(
//         //   child: TextView(
//         //     text: 'Exit App',
//         //     fontSize: 16.spMin,
//         //     fontWeight: FontWeight.w600,
//         //   ),
//         // ),
//         content: TextView(
//           text: unverifiedPrprtsCnntBeVwd,
//           fontSize: 12.spMin,
//           fontWeight: FontWeight.w500,
//         ),
//         actions: <Widget>[
//           SizedBox(
//             width: 5.w,
//           ),
//           Center(
//             child: DefaultButtonMain(
//               color: AppColors.kPrimary1,
//               width: 120.w,
//               text: back,
//               borderColor: AppColors.kPrimary1,
//               borderRadius: 38.r,
//               height: 48.h,
//               onPressed: () {
//                 Navigator.of(context).pop(true);
//               },
//             ),
//           )
//         ],
//       );
//     },
//   );
// }

//8
Future<dynamic> displayLogoutDialog(
  BuildContext context, {
  required VoidCallback onTap,
  required ThemeMode themeMode,
  required ThemeData theme,
}) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        backgroundColor: themeMode == ThemeMode.light ? Colors.white : theme.cardColor,
        title: Center(
          child: TextView(
            text: logOut,
            fontSize: 16.spMin,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: TextView(
          text: sureYouWntToLgout,
          fontSize: 14.spMin,
          maxLines: 2,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w500,
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: DefaultButtonMain(
                  color: themeMode == ThemeMode.light ? AppColors.kWhite200 : AppColors.kTextWhite,
                  width: 120.w,
                  textColor: AppColors.kTextBlack,
                  text: cancel,
                  borderRadius: 38.r,
                  borderColor: themeMode == ThemeMode.dark ? AppColors.kTextBlack : null,
                  height: 48.h,
                  onPressed: () {
                    navigateBack(context);
                  },
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                child: DefaultButtonMain(
                  color: AppColors.kPrimary1,
                  width: 120.w,
                  text: logOut,
                  borderColor: AppColors.kPrimary1,
                  borderRadius: 38.r,
                  height: 48.h,
                  onPressed: onTap,
                ),
              ),
            ],
          )
        ],
      );
    },
  );
}

Future<void> displayRestrictionMessageAlert(
  BuildContext context,
  String title, {
  required String message,
  required bool isDismissible,
  VoidCallback? onTap,
  required ThemeMode themeMode,
  required ThemeData theme,
  // btnOneText,
}) async {
  final width = MediaQuery.sizeOf(context).width;
  showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: themeMode == ThemeMode.light ? AppColors.kWhite : theme.cardColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            // height: deviceH / 3,
            width: width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextView(
                      text: title,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.spMin,
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    TextView(
                      text: message,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      maxLines: 5,
                      fontSize: 16.spMin,
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    DefaultButtonMain(
                      width: 200.w,
                      text: back,
                      color: themeMode == ThemeMode.light ? AppColors.kWhite : theme.cardColor,
                      borderColor: theme.colorScheme.primary,
                      borderRadius: 38.r,
                      textColor: theme.colorScheme.primary,
                      height: 48.h,
                      onPressed: () {
                        navigateBack(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

Future<void> displayTenantValidationAlert(
  BuildContext context, {
  VoidCallback? useDetails,
  VoidCallback? addNewDetails,
  required ThemeMode themeMode,
  required ThemeData theme,
  // btnOneText,
}) async {
  final width = MediaQuery.sizeOf(context).width;
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: themeMode == ThemeMode.light ? AppColors.kWhite : theme.cardColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            height: 300.h,
            // height: deviceH / 3,
            width: width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //A user Logo
                    Image.asset(
                      AppImages.tenantAccount,
                      height: 50.h,
                      width: 50.h,
                      color: themeMode == ThemeMode.light
                          ? AppColors.kPrimary1
                          : AppColors.kPrimaryLight,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextView(
                      text: "Do you want to use your previous details",
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                      maxLines: 5,
                      fontSize: 16.spMin,
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    DefaultButtonMain(
                      width: width,
                      text: "Use Details",
                      color: themeMode == ThemeMode.light
                          ? AppColors.kPrimary1
                          : AppColors.kPrimaryDark,
                      borderRadius: 38.r,
                      textColor: theme.scaffoldBackgroundColor,
                      height: 48.h,
                      onPressed: useDetails,
                    ),
                    Gap(10.h),
                    DefaultButtonMain(
                      width: width,
                      text: "Add New Details",
                      color: themeMode == ThemeMode.light
                          ? theme.scaffoldBackgroundColor
                          : AppColors.kTransparent,
                      borderColor: themeMode == ThemeMode.light
                          ? AppColors.kPrimary1
                          : AppColors.kPrimaryDark,
                      borderRadius: 38.r,
                      textColor: themeMode == ThemeMode.light
                          ? AppColors.kPrimary1
                          : AppColors.kPrimaryDark,
                      height: 48.h,
                      onPressed: addNewDetails,
                    ),
                    // buttonConfirmation(
                    //     onPressed: () {
                    //       navigateBack(context);
                    //     },
                    //     text: back,
                    //     gradient: AppColors.white900Gradient,
                    //     textColor: Colors.black)
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

Future<void> displaySwitchConfirmationMessageAlert(
  BuildContext context,
  String title, {
  required String message,
  required bool isDismissible,
  VoidCallback? onTap,
  required ThemeMode themeMode,
  required ThemeData theme,
  // btnOneText,
}) async {
  final width = MediaQuery.sizeOf(context).width;
  showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: themeMode == ThemeMode.light ? Colors.white : theme.cardColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            // height: 350.h,
            // height: deviceH / 3,
            width: width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextView(
                      text: title,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.spMin,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    RichText(
                      text: TextSpan(
                        text: message,
                        style: TextStyle(
                            color: themeMode == ThemeMode.light ? Colors.black : AppColors.kWhite,
                            fontSize: 16.spMin,
                            fontFamily: ttHoves,
                            fontWeight: FontWeight.w400),
                      ),
                      textAlign: TextAlign.center,
                    ),

                    // TextView(
                    //   text: message,
                    //   fontWeight: FontWeight.w400,
                    //   textAlign: TextAlign.center,
                    //   maxLines: 5,
                    //   fontSize: 16.spMin,
                    // ),
                    SizedBox(
                      height: 26.h,
                    ),

                    DefaultButtonMain(
                      color: AppColors.kPrimary1,
                      width: 200.w,
                      text: continueText,
                      borderColor: AppColors.kPrimary1,
                      borderRadius: 38.r,
                      height: 48.h,
                      onPressed: onTap,
                    ),
                    // buttonConfirmation(
                    //     onPressed: () {
                    //       navigateBack(context);
                    //       navigatePush(context, EditAccountDetailsScreen());
                    //     },
                    //     text: continueText),
                    SizedBox(
                      height: 10.h,
                    ),

                    DefaultButtonMain(
                      width: 200.w,
                      text: back,
                      color: themeMode == ThemeMode.light ? AppColors.kWhite : theme.cardColor,
                      borderColor: theme.colorScheme.primary,
                      borderRadius: 38.r,
                      textColor: theme.colorScheme.primary,
                      height: 48.h,
                      onPressed: () {
                        navigateBack(context);
                      },
                    ),
                    // buttonConfirmation(
                    //     onPressed: () {
                    //       navigateBack(context);
                    //     },
                    //     text: back,
                    //     gradient: AppColors.white900Gradient,
                    //     textColor: Colors.black)
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

///Edit a property amenity by adding amenities alert dialogue.
Future<void> displayAddAmenityAlert(
  BuildContext context, {
  VoidCallback? onTap,
  required ThemeMode themeMode,
  required ThemeData theme,
  required GlobalKey<FormState> aNewAmenityKey,
  required TextEditingController aNewAmenityController,

  // btnOneText,
}) async {
  final width = MediaQuery.sizeOf(context).width;
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: themeMode == ThemeMode.light ? Colors.white : theme.cardColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            // height: deviceH / 3,
            width: width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 150.h,
                      child: Column(
                        children: [
                          TextView(
                            text: "Add Amenity",
                            fontSize: 16.spMin,
                            fontWeight: FontWeight.w600,
                            fontFamily: ttHoves,
                          ),
                          const Gap(10),
                          Form(
                            key: aNewAmenityKey,
                            child: CustomTextField(
                              validator: (aNewAmenity) =>
                                  Validators().validateEmptyField(aNewAmenity),
                              fieldLabel: '',
                              borderRadius: 6.r,
                              borderWidth: 1.5.w,
                              controller: aNewAmenityController,
                              keyboardType: TextInputType.text,
                              hint: "An Amenity",
                            ),
                          ),
                        ],
                      ),
                    ),
                    DefaultButtonMain(
                      color: AppColors.kPrimary1,
                      borderRadius: 38.r,
                      height: 48.h,
                      width: 150.w,
                      fontFamily: ttHoves,
                      fontSize: 16.spMin,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.kWhite,
                      text: "Add Amenity",
                      onPressed: onTap,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

Future<void> displayPhoneNumberNullAlert(
  BuildContext context,
  String title, {
  required String message,
  required bool isDismissible,
  VoidCallback? onTap,
  required ThemeMode themeMode,
  required ThemeData theme,
  // btnOneText,
}) async {
  final width = MediaQuery.sizeOf(context).width;
  showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: themeMode == ThemeMode.light ? Colors.white : theme.cardColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            // height: 350.h,
            // height: deviceH / 3,
            width: width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextView(
                      text: title,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.spMin,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    RichText(
                      text: TextSpan(
                        text: message,
                        style: TextStyle(
                            color: themeMode == ThemeMode.light ? Colors.black : AppColors.kWhite,
                            fontSize: 16.spMin,
                            fontFamily: ttHoves,
                            fontWeight: FontWeight.w400),
                      ),
                      textAlign: TextAlign.center,
                    ),

                    // TextView(
                    //   text: message,
                    //   fontWeight: FontWeight.w400,
                    //   textAlign: TextAlign.center,
                    //   maxLines: 5,
                    //   fontSize: 16.spMin,
                    // ),
                    SizedBox(
                      height: 26.h,
                    ),

                    // buttonConfirmation(
                    //     onPressed: () {
                    //       navigateBack(context);
                    //       navigatePush(context, EditAccountDetailsScreen());
                    //     },
                    //     text: continueText),
                    SizedBox(
                      height: 10.h,
                    ),

                    DefaultButtonMain(
                      color: AppColors.kPrimary1,
                      width: 200.w,
                      text: okayText,
                      borderColor: AppColors.kPrimary1,
                      borderRadius: 38.r,
                      height: 48.h,
                      textColor: Colors.white,
                      onPressed: () {
                        navigateBack(context);
                      },
                    ),
                    // buttonConfirmation(
                    //     onPressed: () {
                    //       navigateBack(context);
                    //     },
                    //     text: back,
                    //     gradient: AppColors.white900Gradient,
                    //     textColor: Colors.black)
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
