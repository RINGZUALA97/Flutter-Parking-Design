import 'package:parking_demo/database/helper.dart';
import 'package:parking_demo/fileAsset/bookingmodelofSetup.dart';
import 'package:sqflite/sqflite.dart';

class BusinessProfileService {
  Future<List<Map<String, dynamic>>> getProfileMapList() async {
    Database db = await DatabaseHelper.instance.db;
    final List<Map<String, dynamic>> result =
        await db.query('businessProfile_table');
    return result;
  }

  Future<List<Profilemodel>> getsProfileList() async {
    final List<Map<String, dynamic>> companyMapList = await getProfileMapList();
    final List<Profilemodel> companyList = [];
    companyMapList.forEach((companyMap) {
      print('');
      companyList.add(Profilemodel.fromMap(companyMap));
    });

    return companyList;
  }
}
