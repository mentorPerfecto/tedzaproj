import 'dart:io';

import 'package:ecommerce/model/local/dummy_data.dart';

// https://musicalminds-be.onrender.com
class ApiConstants {
  // final persist = Persist();
  final String scheme = 'https';
  final String host = "api.escuelajs.co";
  final int receiveTimeout = 3000;
  final int sendTimeout = 2000;

  // final api = 'api';
  final version = 'api/v1';
  final authPath = 'auth';
  final userPath = 'user';

  Uri get signUpUri => Uri(
      scheme: scheme, host: host, path: '$version/users/');

  Uri get loginUri => Uri(
      scheme: scheme, host: host, path: '$version/$authPath/login');


  Uri fetchSingleListingUri({
    required String id,
  }) =>
      Uri(
        scheme: scheme,
        host: host,
        path: '$version/products/$id',
      );

  Uri get getProfileUri =>
      Uri(scheme: scheme, host: host, path: '$version/$authPath/profile');

  Uri get fetchCategoryUri =>
      Uri(scheme: scheme, host: host, path: '$version/categories');

  Uri fetchListingsUri({
    required String page,
    String? categoryId,
    String? minPrice,
    String? maxPrice,
    String? title,
  }) =>
      Uri(
        scheme: scheme,
        host: host,
        path: '$version/products',
        queryParameters: {
          'limit': '5',
          'page': page,
          'price_min': minPrice ?? '',
          'price_max': maxPrice ?? '',
          'categoryId': categoryId ?? '',
          'title': title ?? '',
        },
      );


  Uri updateUserProfileUri({
    required String id,
  }) => Uri(
        scheme: scheme, host: host, path: '$version/users/$id',
      );

  // static final token = Provider((ref) => ref.watch(regViewModelProvider).token);
//*! can be modified
  Map<String, String> apiHeader = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: '*/*',
  };

  Map<String, String> apiHeaderWithToken = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: '*/*',
    HttpHeaders.authorizationHeader: DummyData.accessToken != null ? 'Bearer ${DummyData.accessToken}': "",
  };

  var termsOfSServicesUrl = 'https://fakeapi.platzi.com/en/about/introduction/';
  var privacyPolicyUrl = 'https://fakeapi.platzi.com/en/about/introduction/';

}
