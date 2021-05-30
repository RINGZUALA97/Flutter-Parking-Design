import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database _db;

  DatabaseHelper._instance();
  Future<Database> get db async {
    if (_db == null) {
      print('_db is null');

      _db = await _initDb();
    }
    print('The value of db is $_db');
    return _db;
  }

  static Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  static const String businessProfileTable = 'Profile_table';
  String businessId = 'id';
  String businessName = 'name';
  String businessType = 'businessType';
  String businessAddress = 'address';

  String businessEmail = 'email';

  String userBookingTable = 'userBooking_table';
  String userBookingId = 'id';
  String userBookingName = 'name';
  String userBookingNo = 'vehicleNumber';
  String userBookingType = 'vehicleType';
  String userBookingEmail = 'email';

  String setupTable = 'setup_table';
  String setupId = 'id';
  String setupSetupStatus = 'setupStatus';

  Future<Database> _initDb() async {
    print('Initializing the database');
    Directory dir = await getApplicationDocumentsDirectory();

    String path = dir.path + '/account_keeper.db';

    final accountManagerDb = await openDatabase(
      path,
      version: 2,
      onCreate: _createDb,
      onConfigure: _onConfigure,
    );
    return accountManagerDb;
  }

  void _createDb(Database db, int version) async {
    // Table 1- BusinessProfile Profile
    print('--create database--');
    await db.execute(
      '''
      CREATE TABLE 
        $businessProfileTable(
            $businessId INTEGER PRIMARY KEY AUTOINCREMENT,
            $businessName TEXT,
            $businessType TEXT,
            $businessAddress TEXT,
          
       
            $businessEmail TEXT,
           
            )''',
    );

    await db.execute(
      '''CREATE TABLE
       $userBookingTable(
         $userBookingId INTEGER PRIMARY KEY AUTOINCREMENT,
         $userBookingName TEXT,
         $userBookingNo TEXT,
         $userBookingType TEXT,
         $userBookingEmail TEXT
         )''',
    );
    await db.execute(
      'CREATE TABLE $setupTable($setupId INTEGER PRIMARY KEY AUTOINCREMENT, $setupSetupStatus INT)',
    );
  }
}
