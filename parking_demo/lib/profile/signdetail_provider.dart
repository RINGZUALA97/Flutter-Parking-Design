import 'package:flutter/foundation.dart';

import 'package:parking_demo/business/signdetailService.dart';
import 'package:parking_demo/fileAsset/bookingmodelofSetup.dart';

class BusinessProfileProvider extends ChangeNotifier {
  BusinessProfileService _businessProfileService = new BusinessProfileService();

  BusinessProfilemodel businessProfileData;
  bool isLoading;

  // enter a new company profile
  void loadData() async {
    isLoading = true;
    var temp = await _businessProfileService.getBusinessProfileList();
    businessProfileData = temp.last;
    print(' asd is ${businessProfileData.email}');
    notifyListeners();
    isLoading = false;
  }

  Future<List<BusinessProfilemodel>> getBusinessProfileList() async {
    var _list = await _businessProfileService.getBusinessProfileList();
    print(_list.toString());
    return _list;
  }
}
