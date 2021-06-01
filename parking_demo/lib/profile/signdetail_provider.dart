import 'package:flutter/foundation.dart';

import 'package:parking_demo/fileAsset/bookingmodelofSetup.dart';
import 'package:parking_demo/profile/signdetailService.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileService _sProfileService = new ProfileService();

  Profilemodel businessProfileData;
  bool isLoading;

  // enter a new company profile
  void loadData() async {
    isLoading = true;
    var temp = await _sProfileService.getsProfileList();
    businessProfileData = temp.last;

    notifyListeners();
    isLoading = false;
  }

  Future<List<Profilemodel>> getsProfilesList() async {
    var _list = await _sProfileService.getsProfileList();
    print(_list.toString());
    return _list;
  }
}
