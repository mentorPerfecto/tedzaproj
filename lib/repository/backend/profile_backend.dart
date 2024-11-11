// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'package:ecommerce/repository/services/api/api_service.dart';

class ProfileBackend extends ApiService {


  Future<dynamic> getProfileData() async {
    return getMth(getProfileUri, headers: apiHeaderWithToken);
  }

  Future<dynamic> updateUserProfile(
      {required String email,
      required String name,
      required String id,

      }) async {
    return putMth(
      updateUserProfileUri(id: id),
      headers: apiHeaderWithToken,
      body: {
        'email': email,
        'name': name,
      },
    );
  }

}
