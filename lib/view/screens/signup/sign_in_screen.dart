import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce/src/components.dart';
import 'package:ecommerce/src/config.dart';
import 'package:ecommerce/src/utils.dart';
import 'package:ecommerce/src/screens.dart';
import 'package:ecommerce/src/providers.dart';

class SignInScreen extends ConsumerStatefulWidget {
  final bool backBtnVisibility;

  const SignInScreen({super.key, required this.backBtnVisibility});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final loginFormKey = GlobalKey<FormState>();
  FocusNode passwordFocusNode = FocusNode();
  // bool isChecked = false;
  //Contains alreadyHaveAnAccount text widget
  doNotHaveAccount(ThemeData theme, ThemeMode themeMode) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: dontHaveAnAccount,
          style: TextStyle(
            color: theme.colorScheme.primary,
            fontSize: 16.spMin,
            fontFamily: ttHoves,
            fontWeight: FontWeight.w400,
          ),
          children: <TextSpan>[
            TextSpan(
              text: createUserAccount,
              style: TextStyle(
                color: themeMode == ThemeMode.light
                    ? AppColors.kPrimary1
                    : AppColors.kPrimary150,
                fontSize: 16.spMin,
                fontWeight: FontWeight.w400,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => navigateReplace(
                      context,
                      const CreateAccountScreen(),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(authViewModel);
    var themeMode = ref.watch(themeViewModel).themeMode;
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBars.mainAppBar(
        context,
        isVisible: widget.backBtnVisibility,
        backgroundColor: theme.scaffoldBackgroundColor,
        arrowBackColor: theme.colorScheme.primary,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 15.h,
            horizontal: 15.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  width: 235.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: welcomeBack,
                        textStyle: theme.textTheme.titleLarge,
                      ),
                      TextView(
                        text: pleaseEnterDetails,
                        textStyle: theme.textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Form(
                  key: loginFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        fieldLabel: '',
                        hint: emailAddressText,
                        controller: provider.loginEmailController,
                        validator: (value) =>
                            Validators().validateEmptyTextField(value),
                        //onChanged: (value)=> provider.updateButtonState(),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        fieldLabel: '',
                        hint: password,
                        focusNode: passwordFocusNode,
                        password: true,
                        validator: (value) =>
                            Validators().validateEmptyTextField(value),
                        controller: provider.loginPwdController,
                        obscureInput: provider.loginObscurePass,
                        onObscureText: provider.toggleLoginPwdVisibility,
                        //onChanged: (value)=> provider.updateButtonState(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text.rich(
                  TextSpan(
                      text: forgortPassword,
                      style: TextStyle(
                        color: themeMode == ThemeMode.light
                            ? AppColors.kPrimary1
                            : AppColors.kPrimary150,
                        fontFamily: ttHoves,
                        fontSize: 16.spMin,
                        fontWeight: FontWeight.w400,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // navigatePush(
                          //   context, const ForgotPasswordScreen());
                        }),
                ),
                SizedBox(
                  height: 30.h,
                ),
                DefaultButtonMain(
                  height: 48.h,
                  text: signIn,
                  borderRadius: 40.r,
                  color: AppColors.kPrimary1,
                  buttonState: provider.buttonLoginState!.buttonState,
                  onPressed: () {
                    if (loginFormKey.currentState!.validate()) {
                      loginFormKey.currentState!.save();
                      provider.userLogin(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        doNotHaveAccount(theme, themeMode),
      ],
    );
  }
}
