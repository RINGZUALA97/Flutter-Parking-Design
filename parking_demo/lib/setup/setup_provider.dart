import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:parking_demo/fileAsset/bookingService.dart';
import 'package:parking_demo/fileAsset/bookingmodelofSetup.dart';

import 'package:parking_demo/setup/setup_service.dart';

class SetupProvider extends ChangeNotifier {
  int setupStatus = SetupStatus.NOTSETUP;
  bool isLoading;

  String _businessName;
  String _motorNO;
  String _address;
  String _email;

  // SetupService _setupService = new SetupService();

  String getName() => _businessName;
  void setName(value) {
    _businessName = value;
    notifyListeners();
    print('name is $value');
  }

  String getmotorNo() => _motorNO;
  void setmOTORnO(value) {
    _motorNO = value;
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
  void saveUSEprofile() {
    SetupService _setupService = new SetupService();
    _setupService.saveProfile(
      BusinessProfilemodel(
        name: _businessName,
        address: _address,
        motorNo: _motorNO,
        email: _email,
      ),
    );
  }
}
