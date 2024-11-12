// ignore_for_file: use_build_context_synchronously


import 'package:ecommerce/repository/services/api/api_service.dart';

class AuthBackend extends ApiService {

  Future<dynamic> signIn({
    required String email,
    required String password,
  }) async {
    return postMth(
      loginUri,
      headers: apiHeader,
      body: {'email': email, 'password': password},
    );
  }

  Future<dynamic> signUp({
    required String email,
    required String password,
    required String fullName,
  }) async {
    return postMth(
      signUpUri,
      headers: apiHeader,
      body: {
        'name': fullName ,
        'email': email,
        'password': password,
        'avatar': "https://picsum.photos/800",
      },
    );
  }

}
