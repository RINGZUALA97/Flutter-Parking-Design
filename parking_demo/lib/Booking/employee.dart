class Contact {
  static const tblContact = 'contacts';
  static const colId = 'id';
  static const colName = 'name';
  static const colNumber = 'number';

  Contact({this.id, this.name, this.number});

  int id;
  String name;
  String number;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': name,
      'number': number,
    };
    if (id != null) map[colId] = id;
    return map;
  }

  Contact.fromMap(Map<String, dynamic> map) {
    id = map[colId];
    name = map[colName];
    number = map[colNumber];
  }
}
