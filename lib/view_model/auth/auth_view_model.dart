// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:ecommerce/view/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rebirth/rebirth.dart';
import 'package:ecommerce/src/config.dart';
import 'package:ecommerce/src/models.dart';
import 'package:ecommerce/src/providers.dart';
import 'package:ecommerce/src/repository.dart';
import 'package:ecommerce/src/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authViewModel = ChangeNotifierProvider((ref) => AuthViewModel());

class AuthViewModel extends ChangeNotifier {
  late SharedPreferences sharedPreferences;

  final TextEditingController _loginEmailController =
      TextEditingController(text: DummyData.emailAddress ?? '');
  final TextEditingController _loginPwdController = TextEditingController();
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmNewPasswordController = TextEditingController();

  final TextEditingController _forgotPwdEmailController = TextEditingController();

  final TextEditingController _resetPwdConfirmController = TextEditingController();

  final TextEditingController _resetPwdController = TextEditingController();

  bool _loginObscurePass = true;
  bool _obscureOldPass = true;
  bool _obscureNewPass = true;
  bool _obscureConfirmNewPass = true;

  final authService = AuthBackend();

  final loginFormKey = GlobalKey<FormState>();


  CustomButtonState _buttonLoginState = CustomButtonState(
    buttonState: ButtonState.idle,
    text: login,
  );


  TextEditingController get loginEmailController => _loginEmailController;
  TextEditingController get loginPwdController => _loginPwdController;
  TextEditingController get oldPasswordController => _oldPasswordController;
  TextEditingController get newPasswordController => _newPasswordController;
  TextEditingController get confirmNewPasswordController => _confirmNewPasswordController;

  TextEditingController get forgotPwdEmailController => _forgotPwdEmailController;

  TextEditingController get resetPwdConfirmController => _resetPwdConfirmController;

  TextEditingController get resetPwdController => _resetPwdController;
  bool get loginObscurePass => _loginObscurePass;
  bool get obscureOldPass => _obscureOldPass;
  bool get obscureNewPass => _obscureNewPass;
  bool get obscureConfirmPass => _obscureConfirmNewPass;
  CustomButtonState? get buttonLoginState => _buttonLoginState;

  toggleOldPassVisibility() {
    _obscureOldPass = !_obscureOldPass;
    notifyListeners();
  }

  toggleNewPassVisibility() {
    _obscureNewPass = !_obscureNewPass;
    notifyListeners();
  }

  toggleConfirmPassVisibility() {
    _obscureConfirmNewPass = !_obscureConfirmNewPass;
    notifyListeners();
  }

  toggleLoginPwdVisibility() {
    _loginObscurePass = !_loginObscurePass;
    notifyListeners();
  }

  Future<void> userLogin(BuildContext context) async {
    try {
      _buttonLoginState = CustomButtonState(
        buttonState: ButtonState.loading,
        text: login,
      );
      notifyListeners();
      await authService
          .signInAdmin(
        email: _loginEmailController.text.toLowerCase(),
        password: _loginPwdController.text,
      )
          .then((value) async {
        if (value != null) {
          showToast(
            msg: 'Login successful',
            isError: false,
          );

          DummyData.emailAddress = _loginEmailController.text;
          DummyData.password = _loginPwdController.text;
          await saveUserEmail(_loginEmailController.text);
          await getUserEmail();
          await saveAccessToken(value['access_token'].toString());
          await getAccessToken();
          await saveAppTme();
          await saveUserPassword(password);
          await getUserPassword();

          WidgetRebirth.createRebirth(context: context);
        }
        }).whenComplete(() {
        _buttonLoginState = CustomButtonState(
          buttonState: ButtonState.idle,
          text: login,
        );
        notifyListeners();
      });
    } catch (e, s) {
      showToast(
        msg: somethingWentWrong,
        isError: true,
      );
      logger
        ..i(checkErrorLogs)
        ..e(s);
    }
  }


  Future<void> userAutoLogin(BuildContext context,
      {required String email, required String password}) async {
    logger.f(email);
    logger.f(password);
    try {
      _buttonLoginState = CustomButtonState(
        buttonState: ButtonState.loading,
        text: login,
      );
      notifyListeners();
      await authService
          .signInAdmin(
        email: email.toLowerCase(),
        password: password,
      )
          .then((value) async {
        if (value != null) {
          DummyData.emailAddress = email.toLowerCase();
          DummyData.password = password;
          await saveUserEmail(email.toLowerCase());
          await getUserEmail();
          await saveAccessToken(value['data']['access_token'].toString());
          await getAccessToken();
          await saveAppTme();
          await saveUserPassword(password);
          await getUserPassword();
          await ProfileViewModel().loadData(context).then((value) async {
            if (value != null) {
              DummyData.fullName = value.name.toString();

            }
          });
          notifyListeners();
          await navigateReplace(context, const OnboardingScreen());
        } else {
          navigatePush(context, const OnboardingScreen());
        }
      });
    } catch (e, s) {
      navigatePush(context, const OnboardingScreen());
      logger
        ..i(checkErrorLogs)
        ..e(s);
    }
  }

  saveUserEmail(localUserEmail) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("Email", localUserEmail);
    logger.i("saved Email Address ${DummyData.emailAddress}");
  }

  saveUserPassword(localPassword) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("Password", localPassword);
    logger.i("saved Password");
  }

  getUserEmail() async {
    sharedPreferences = await SharedPreferences.getInstance();
    DummyData.emailAddress = sharedPreferences.getString("Email");
    logger.i("get  Email Address ${DummyData.emailAddress}");
  }

  getUserPassword() async {
    sharedPreferences = await SharedPreferences.getInstance();
    DummyData.password = sharedPreferences.getString("Password");
    logger.i("get Password ${DummyData.password}");
  }

  saveAccessToken(accessToken) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("accessToken", accessToken);
    logger.i("saved accessToken");
  }

  saveRefreshToken(refreshToken) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("refreshToken", refreshToken);
    logger.i("saved refreshToken");
  }

  saveAppTme() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("firstTimeOnApp", false);
    logger.i("saved firstTimeOnApp");
  }

  getAccessToken() async {
    sharedPreferences = await SharedPreferences.getInstance();
    DummyData.accessToken = sharedPreferences.getString("accessToken");
    log("get accessToken : ${DummyData.accessToken}");
    return sharedPreferences.getString("accessToken");
  }

  Future<void> initPage() async {
    _oldPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmNewPasswordController = TextEditingController();
  }
}
