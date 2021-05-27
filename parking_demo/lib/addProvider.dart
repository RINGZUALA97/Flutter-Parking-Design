import 'package:flutter/cupertino.dart';

class AddProvider extends ChangeNotifier {
  String name;
  String address;
  String type;
  String numberV;

  void getname(val) {
    name = val;
    notifyListeners();
  }

  void getaddress(val1) {
    address = val1;
    notifyListeners();
  }

  void gettype(val2) {
    type = val2;
    notifyListeners();
  }

  void getnumberV(val3) {
    numberV = val3;
    notifyListeners();
  }
}
