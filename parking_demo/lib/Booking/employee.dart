class Contact {
  static const tblContact = 'contacts';
  static const colId = 'id';
  static const colName = 'name';
  static const colNumber = 'number';
  static const colAddress = 'address';

  Contact({this.id, this.name, this.number, this.address});

  int id;
  String name;
  String number;
  String address;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': name,
      'number': number,
      'address': address,
    };
    if (id != null) map[colId] = id;
    return map;
  }

  Contact.fromMap(Map<String, dynamic> map) {
    id = map[colId];
    name = map[colName];
    number = map[colNumber];
    address = map[colAddress];
  }
}

class Register {
  static const reRegister = 'register';
  static const reId = 'id';
  static const reName = 'username';
  static const reNumber = 'usernumber';
  static const reAddress = 'useraddress';

  int id;
  String username;
  String usernumber;
  String useraddress;

  Register({this.id, this.username, this.usernumber, this.useraddress});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'username': username,
      'usernumber': usernumber,
      'useraddress': useraddress,
    };
    if (id != null) map[reId] = id;
    return map;
  }

  Register.fromMap(Map<String, dynamic> map) {
    id = map[reId];
    username = map[reName];
    usernumber = map[reNumber];
    useraddress = map[reAddress];
  }
}
