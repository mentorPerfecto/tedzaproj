import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce/model/local/dummy_data.dart';
import 'package:ecommerce/src/components.dart';
import 'package:ecommerce/src/config.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/src/providers.dart';
import 'package:ecommerce/src/utils.dart';

class AccountSettingScreen extends ConsumerStatefulWidget {
  const AccountSettingScreen({super.key});

  @override
  ConsumerState<AccountSettingScreen> createState() =>
      AccountSettingScreenState();
}

class AccountSettingScreenState extends ConsumerState<AccountSettingScreen> {
  bool isContactDetailsVisible = false;

  @override
  Widget build(BuildContext context) {
    var userProfileProvider = ref.watch(profileViewModel);
    var themeProvider = ref.watch(themeViewModel).themeMode;
    var theme = Theme.of(context);
    return userProfileProvider.isUpdatingUserProfile
        ? const SuccessLoadingScreen(informationText: '')
        : Scaffold(
            backgroundColor: theme.scaffoldBackgroundColor,
            appBar: AppBars.mainAppBar(
              context,
              text: "Account",
              backgroundColor: theme.scaffoldBackgroundColor,
              arrowBackColor: theme.colorScheme.primary,
              trailing: Padding(
                padding: const EdgeInsets.all(17.0),
                child: GestureDetector(
                  onTap: () {
                    displayDeleteUserProfileConfirmationMessageAlert(
                      theme: theme,
                      themeMode: themeProvider,
                      isDismissible: true,
                      context,
                      'Confirmation Message',
                      onTap: () {
                        navigateBack(context);
                        displayValidatePasswordAlert(
                          context,
                          theme: theme,
                          themeMode: themeProvider,
                          actionText: deleteAccountText,
                          passwordController:
                              userProfileProvider.validatePasswordControllers,
                          obscureInput: userProfileProvider.validatePassword,
                          onTap: () {
                            if (userProfileProvider
                                    .validatePasswordControllers.text ==
                                DummyData.password) {
                              navigateBack(context);
                              // userProfileProvider.deleteUserProfile(
                              //   context,
                              // );
                            } else {
                              showToast(msg: incorrectPassword, isError: true);
                            }
                          },
                        );
                      },
                    );
                  },
                  child: const Icon(
                    CupertinoIcons.delete,
                    color: AppColors.kErrorPrimary,
                  ),
                ),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        // vertical: 20.h,
                        horizontal: 20.w,
                      ),
                      child: SizedBox(
                        width: 360.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gap(20.h),
                            Align(
                              child: ProfileImage(
                                imageUrl: userProfileProvider
                                    .profileData!.avatar
                                    .toString(),
                                imageType: ProfileImageType.user,
                                // editImage: true,
                                height: 100.h,
                                fontSize: 24.spMin,
                                width: 100.w,
                                // onEditImageTap: () {
                                //   userProfileProvider
                                //       .updateProfilePhoto(context);
                                // },
                              ),
                            ),
                            Gap(30.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: personalInformation,
                                  fontSize: 18.spMin,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: ttHoves,
                                ),
                                Gap(20.h),
                                CustomTextField(
                                  fieldLabel: '',
                                  hint: firstNameText,
                                  controller:
                                      userProfileProvider.fullNameController,
                                ),
                                Gap(5.h),
                                CustomTextField(
                                  fieldLabel: '',
                                  hint: emailAddressText,
                                  controller: userProfileProvider
                                      .emailAddressController,
                                  readOnly: true,
                                ),
                                Gap(10.h),
                              ],
                            ),
                            Gap(
                              35.h,
                            ),
                            DefaultButtonMain(
                              onPressed: () {
                                userProfileProvider
                                    .updateUserProfile(context)
                                    .then((value) =>
                                        userProfileProvider.loadData(context));
                              },
                              height: 48.h,
                              borderRadius: 40.r,
                              color: AppColors.kPrimary1,
                              text: updateChanges,
                              textColor: AppColors.kWhite,
                            ),

                            Gap(
                              20.h,
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}

class XampTenantIDDetails extends StatelessWidget {
  const XampTenantIDDetails({
    super.key,
    required this.uniqueIdFrmXamp,
    required this.name,
    required this.email,
    required this.onTap,
    required this.isContactDetailsVisible,
    this.contactImage,
  });

  final String uniqueIdFrmXamp;
  final String name;
  final String email;
  final VoidCallback onTap;
  final String? contactImage;
  final bool isContactDetailsVisible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isContactDetailsVisible,
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(20.h),
            TextView(
              text: xampTenantIdHeading,
              fontSize: 18.spMin,
              fontWeight: FontWeight.w600,
              fontFamily: ttHoves,
            ),
            Gap(15.h),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 14.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.kBackground,
              ),
              child: Row(
                children: [
                  ProfileImage(
                    height: 100.h,
                    width: 100.w,
                    imageType: ProfileImageType.user,
                    imageUrl: contactImage ?? 'ded',
                  ),
                  Gap(15.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextView(
                        text: name,
                        fontSize: 16.spMin,
                        fontWeight: FontWeight.w500,
                        fontFamily: ttHoves,
                        color: AppColors.kTextBlack,
                      ),
                      Gap(4.h),
                      TextView(
                        text: email,
                        color: AppColors.kSubText,
                        fontSize: 13.spMin,
                        fontWeight: FontWeight.w400,
                        fontFamily: ttHoves,
                      ),
                      Gap(
                        6.h,
                      ),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                                text: uniqueIDText,
                                style: TextStyle(
                                  fontSize: 13.spMin,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.kSubText,
                                  fontFamily: ttHoves,
                                ),
                                children: [
                                  TextSpan(
                                    text: uniqueIdFrmXamp,
                                    style: TextStyle(
                                      fontSize: 13.spMin,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.kTextBlack,
                                      fontFamily: ttHoves,
                                    ),
                                  )
                                ]),
                          ),
                          Gap(
                            5.w,
                          ),
                          InkWell(
                            onTap: onTap,
                            child: Image.asset(
                              AppImages.copyTextIcon,
                              width: 16.w,
                              height: 16.h,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GenderDropDownContainer extends ConsumerWidget {
  const GenderDropDownContainer({
    super.key,
    required this.gender,
    required this.genderType,
    required this.onChange,
  });

  final String? gender;
  final List<String> genderType;
  final Function(String?) onChange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var themeMode = ref.watch(themeViewModel).themeMode;
    var theme = Theme.of(context);
    return Container(
      width: 340.w,
      height: 48.h,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(
          6.r,
        ),
        border: Border.all(
          width: 1.2.w,
          color: themeMode == ThemeMode.light
              ? AppColors.kDisabledButton
              : AppColors.kDarkSecondary,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 10.h,
      ),
      child: Row(
        children: [
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                dropdownColor: theme.scaffoldBackgroundColor,
                isExpanded: true,
                hint: Text(
                  gender ?? "Select Gender",
                  style: TextStyle(
                      color: themeMode == ThemeMode.light
                          ? Colors.black
                          : AppColors.kDisabledButton),
                ),
                value: gender,
                icon: Image.asset(
                  AppImages.dropDown,
                  color: theme.colorScheme.primary,
                ),
                iconSize: 24,
                // elevation: 16,
                style: TextStyle(
                  color: themeMode == ThemeMode.light
                      ? Colors.black
                      : AppColors.kDisabledButton,
                ),
                onChanged: onChange,
                items: genderType.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: TextView(
                      text: value,
                      color: themeMode == ThemeMode.light
                          ? Colors.black
                          : AppColors.kDisabledButton,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
