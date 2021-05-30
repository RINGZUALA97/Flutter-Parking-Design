import 'package:parking_demo/database/helper.dart';
import 'package:parking_demo/fileAsset/bookingProfileModel.dart';
import 'package:parking_demo/fileAsset/setup.dart';
import 'package:sqflite/sqflite.dart';

class BookingService {
  Future<int> setup(Setup _setup) async {
    Database db = await DatabaseHelper.instance.db;
    return db.insert('userBooking_table', _setup.toMap());
  }

  Future<List<Map<String, dynamic>>> getProfileMapList() async {
    Database db = await DatabaseHelper.instance.db;
    final List<Map<String, dynamic>> result =
        await db.query('userBooking_table');
    return result;
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

  Future<int> saveuserBooking(BookingProfiles _payload) async {
    Database db = await DatabaseHelper.instance.db;
    int result = await db.insert(
      'userBooking_table',
      _payload.toMap(),
    );
    print('Saving booking Profile');
    print('the return value is : $result');
    final List<Map<String, dynamic>> results = await db.rawQuery('''
    SELECT * FROM userBooking_table
    WHERE id = $result
    ''');
    var data = results.first;
    print('user booking name is ${data['name']}');
    print('vehicle number is  ${data['vehicleNumber']}');
    print('vehicle type is is ${data['vehicleType']}');
    print('email is ${data['email']}');
    return result;
  }

  Future<List<BookingProfiles>> getProfileList() async {
    final List<Map<String, dynamic>> companyMapList = await getProfileMapList();
    final List<BookingProfiles> companyList = [];
    companyMapList.forEach((companyMap) {
      companyList.add(BookingProfiles.fromMap(companyMap));
    });
    // companyList.sort((taskA, taskB) => taskA.date.compareTo(taskB.date));
    return companyList;
  }

  Future<BookingProfiles> getCurrentProfileList() async {
    final List<Map<String, dynamic>> companyMapList = await getProfileMapList();
    final List<BookingProfiles> companyList = [];
    companyMapList.forEach((companyMap) {
      companyList.add(BookingProfiles.fromMap(companyMap));
    });
    // companyList.sort((taskA, taskB) => taskA.date.compareTo(taskB.date));
    return companyList.last;
  }

  Future<int> insert(BookingProfiles company) async {
    Database db = await DatabaseHelper.instance.db;
    print('inserting company profile');
    final int result = await db.insert('userBooking_table', company.toMap());
    return result;
  }
}

class SetupStatus {
  static const int NOTSETUP = 0;
  static const int PARTIALSETUP = 1;
  static const int SETUP = 2;
}
