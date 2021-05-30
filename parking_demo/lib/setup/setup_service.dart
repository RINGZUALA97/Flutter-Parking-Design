import 'package:parking_demo/database/helper.dart';
import 'package:parking_demo/fileAsset/bookingService.dart';
import 'package:parking_demo/fileAsset/bookingmodelofSetup.dart';
import 'package:parking_demo/fileAsset/setup.dart';

import 'package:sqflite/sqflite.dart';

class SetupService {
  Future<int> setup(Setup _setup) async {
    Database db = await DatabaseHelper.instance.db;
    //---------Insert into Setup Table--------------
    return db.insert('setup_table', _setup.toMap());
  }

  Future<Setup> getSetup() async {
    Database db = await DatabaseHelper.instance.db;
    final List<Map<String, dynamic>> results = await db.rawQuery('''
    SELECT * FROM setup_table
    ''');

    if (results.length != 0) {
      return Setup.fromMap(results.last);
    } else
      return Setup(setupStatus: SetupStatus.NOTSETUP);
  }

  //-----------Save Business Profile-------------
  Future<int> saveProfile(Profilemodel _payload) async {
    Database db = await DatabaseHelper.instance.db;
    int result = await db.insert(
      'businessProfile_table',
      _payload.toMap(),
    );
    print('Saving business Profile');
    print('the return value is : $result');
    final List<Map<String, dynamic>> results = await db.rawQuery('''
    SELECT * FROM businessProfile_table
    WHERE id = $result
    ''');
    var data = results.first;
    print('business name is ${data['name']}');
    print('Address name is ${data['address']}');
    print('email name is ${data['email']}');
    print('type name is ${data['businessType']}');
    return result;
  }
}
