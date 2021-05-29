import 'dart:io';

import 'package:parking_demo/Booking/employee.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelpering {
  static const _databaseName = 'ContactData.db';
  static const _databaseVersion = 1;

  DatabaseHelpering._();
  static final DatabaseHelpering instance = DatabaseHelpering._();

  Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(dataDirectory.path, _databaseName);
    return await openDatabase(dbPath,
        version: _databaseVersion, onCreate: _onCreateDb);
  }

  _onCreateDb(Database db, int version) async {
    await db.execute(''' 
    CREATE TABLE
    ${Contact.tblContact}(
    ${Contact.colId} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${Contact.colName} TEXT NO NULL, 
    ${Contact.colNumber} TEXT NO NULL) 
      ''');
  }

  Future<int> insertContact(Contact contact) async {
    Database db = await database;
    return await db.insert(Contact.tblContact, contact.toMap());
  }

  Future<List<Contact>> fetchContact() async {
    Database db = await database;
    List<Map> contacts = await db.query(Contact.tblContact);
    print('s');
    return contacts.length == 0
        ? []
        : contacts.map((e) => Contact.fromMap(e)).toList();
  }
}
