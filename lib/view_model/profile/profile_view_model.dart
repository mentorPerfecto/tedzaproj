// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:ecommerce/repository/backend/profile_backend.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce/src/models.dart';
import 'package:ecommerce/src/config.dart';
import 'package:ecommerce/src/screens.dart';
import 'package:ecommerce/src/utils.dart';

final profileViewModel = ChangeNotifierProvider((ref) => ProfileViewModel());

class ProfileViewModel extends ChangeNotifier {
  final profileService = ProfileBackend();

  final bool _validatePassword = true;
  bool get validatePassword => _validatePassword;

  bool isFetchingProfile = false;

  final TextEditingController _validatePasswordControllers =
      TextEditingController();
  TextEditingController get validatePasswordControllers =>
      _validatePasswordControllers;
  final TextEditingController _fullNameController =
      TextEditingController(text: DummyData.fullName ?? '');
  final TextEditingController _emailAddressController =
      TextEditingController(text: DummyData.emailAddress ?? '');
  UserResponseModel? _profileData;
  UserResponseModel? get profileData => _profileData;

  TextEditingController get emailAddressController => _emailAddressController;
  TextEditingController get fullNameController => _fullNameController;

  bool _isUpdatingUserProfile = false;
  bool get isUpdatingUserProfile => _isUpdatingUserProfile;

  ///Method to update user profile
  Future<void> updateUserProfile(BuildContext context) async {
    _isUpdatingUserProfile = true;
    notifyListeners();
    try {
      await profileService
          .updateUserProfile(
        name: _fullNameController.text.toString(),
        email: _emailAddressController.text.toString(),
        id: _profileData!.id.toString()
      )
          .then((value) async {
        if (value != null) {
          showToast(
            msg: "Profile Updated Successfully",
            isError: false,
          );
          _isUpdatingUserProfile = false;
          notifyListeners();
        }
      }).whenComplete(() {
        _isUpdatingUserProfile = false;
        notifyListeners();
      });
    } catch (e, s) {
      logger
        ..i(checkErrorLogs)
        ..e(s);
    }
  }
  Future<UserResponseModel?> loadData(BuildContext context) async {
    isFetchingProfile = true;
    notifyListeners();
    try {
      await profileService.getProfileData().then((value) async {
        if (value != null) {
          final decodedResponse = jsonDecode(value.toString());

          if (decodedResponse != null) {
            _profileData = UserResponseModel.fromJson(decodedResponse);
            DummyData.fullName = _profileData?.name.toString();
            notifyListeners();
            // log(DummyData.phoneNumber.toString());
            // _gender =  _profileData!.gender.toString();
          }else{
            navigateReplace(context, const DashBoardScreen());
          }
        }
        isFetchingProfile = false;
        notifyListeners();
      }).whenComplete(() {
        notifyListeners();
      });
    } catch (e) {
      // showToast(
      //   msg: e.toString(),
      //   isError: true,
      // );
    }

    return _profileData;
  }

// //Method to delete user profile.
//   Future<void> deleteUserProfile(BuildContext context) async {
//     try {
//       _isUpdatingUserProfile = true;
//       notifyListeners();
//       await profileService.deleteProfile().then((value) async {
//         if (value != null) {
//           final decodedResponse = jsonDecode(value.toString());
//
//           if (decodedResponse['status'].toString() == 'true') {
//             _validatePasswordControllers.clear();
//             showToast(
//               msg: decodedResponse['message'].toString(),
//               isError: false,
//             );
//             SharedPreferences prefs = await SharedPreferences.getInstance();
//             await prefs.remove('Email');
//             await prefs.remove('Password');
//             await prefs.remove('accessToken');
//             await Future.delayed(const Duration(seconds: 2));
//
//             WidgetRebirth.createRebirth(context: context);
//
//             _isUpdatingUserProfile = false;
//             notifyListeners();
//           } else if (value['status'].toString() == 'false') {
//             showToast(
//               msg: value['message'].toString(),
//               isError: false,
//             );
//
//             _isUpdatingUserProfile = false;
//             notifyListeners();
//           }
//         }
//       }).whenComplete(() {
//         _isUpdatingUserProfile = false;
//         notifyListeners();
//       });
//     } catch (e, s) {
//       logger
//         ..i(checkErrorLogs)
//         ..e(s);
//     }
//   }

  String getInitials(String name) {
    List<String> nameParts = name.split(' ');
    String initials = '';
    for (var part in nameParts) {
      initials += part[0];
    }
    return initials.toUpperCase();
  }
}
