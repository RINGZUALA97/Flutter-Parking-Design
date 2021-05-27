import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:parking_demo/booking/bookingService.dart';
import 'package:parking_demo/booking/bookingmodelofSetup.dart';

import 'package:parking_demo/setup/services/setup_service.dart';

class SetupProvider extends ChangeNotifier {
  int setupStatus = SetupStatus.NOTSETUP;
  bool isLoading;

  String _businessName;
  String _typeOfBusiness;
  String _address;
  String _email;

  // SetupService _setupService = new SetupService();

  String getBusinessName() => _businessName;
  void setBusinessName(value) {
    _businessName = value;
    notifyListeners();
    print('name is $value');
  }

  String getTypeOfBusiness() => _typeOfBusiness;
  void setTypeOfBusiness(value) {
    _typeOfBusiness = value;
    notifyListeners();
  }

  String getAddress() => _address;
  void setAddress(value) {
    _address = value;
    notifyListeners();
  }

  String getEmail() => _email;
  void setEmail(value) {
    _email = value;
    notifyListeners();
  }

  //------Save Business Profile------------
  void saveBusinessProfile() {
    SetupService _setupService = new SetupService();
    _setupService.saveBusinessProfile(
      BusinessProfilemodel(
        name: _businessName,
        address: _address,
        businessType: _typeOfBusiness,
        email: _email,
      ),
    );
  }
}
