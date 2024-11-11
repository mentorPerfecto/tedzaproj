
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce/src/config.dart';
import 'package:ecommerce/src/models.dart';
import 'package:ecommerce/src/repository.dart';
import 'package:ecommerce/src/utils.dart';

final dashboardViewModel =
    ChangeNotifierProvider((ref) => DashboardViewModel());

class DashboardViewModel extends ChangeNotifier {
  int? _currentIndex = 0;
  String? _landlordProperty;


  String? get landlordProperty => _landlordProperty;
  final String _token = '';
  String get token => _token;


  int get currentIndex => _currentIndex!;
  String? country, state, locality, subLocality;

  void selectProperty(String? property) {
    _landlordProperty = property;
    notifyListeners();
  }

 

 


  Future<void> setBottomBarItem(BuildContext context, int selectedPageIndex) async {
    _currentIndex = selectedPageIndex;
    getDeviceLocation();
    notifyListeners();
  }

  String getTitle(num? role) {
    switch (_currentIndex) {
      case 1:
        return marketPlace;
      case 2:
        return role == 2 ? "Properties" : listings;
      case 3:
        return wallet;
      case 4:
        return more;
      default:
        return 'Hello, ${UtilFunctions.capitalizeAllWord(DummyData.fullName.toString())}';
    }
  }

  Future<void> getDeviceLocation() async {
    final service = LocationService();
    // print(service);
    try {
      final locationData = await service.getLocation();
      if (locationData != null) {
        final placeMark =
            await service.getPlaceMark(locationData: locationData);

        country = placeMark?.country ?? '';
        state = placeMark?.administrativeArea ?? '';
        locality = placeMark?.locality ?? '';
        subLocality = placeMark?.subAdministrativeArea ?? '';
        // addressPlace = placeMark?.country.toString();   addressPlacemarks.reversed.last.locality.toString();
        DummyData.city = "$locality";
        DummyData.state = "$state";
        // DummyData.userLatitude = locationData.latitude!;
        // DummyData.userLongitude = locationData.longitude!;

        //logger.t('${DummyData.city} ${DummyData.state}',);
        // logger.t(DummyData.userLatitude);
        // logger.t(DummyData.userLongitude);

        //print('${locationData.latitude!}  + ' ' + ${locationData.longitude!}');
        notifyListeners();
        // fetchVendorsNearYou();
      }
    } on Exception catch (e) {
      logger.e(e);
    }
  }
}
