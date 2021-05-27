import 'package:parking_demo/booking/bookingmodelofSetup.dart';
import 'package:parking_demo/database/helper.dart';
import 'package:sqflite/sqflite.dart';

class BusinessProfileService {
  Future<List<Map<String, dynamic>>> getBusinessProfileMapList() async {
    Database db = await DatabaseHelper.instance.db;
    final List<Map<String, dynamic>> result =
        await db.query('businessProfile_table');
    return result;
  }

  Future<List<BusinessProfilemodel>> getBusinessProfileList() async {
    final List<Map<String, dynamic>> companyMapList =
        await getBusinessProfileMapList();
    final List<BusinessProfilemodel> companyList = [];
    companyMapList.forEach((companyMap) {
      print('');
      companyList.add(BusinessProfilemodel.fromMap(companyMap));
    });

    return companyList;
  }
}
