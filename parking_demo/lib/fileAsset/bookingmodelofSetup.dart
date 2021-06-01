class Profilemodel {
  int id;
  String name;
  String address;

  String email;

  String motorNo;
  // 0 - Incomplete, 1 - Complete

  Profilemodel({
    this.name,
    this.address,
    this.email,
    this.motorNo,
  });
  Profilemodel.withId({
    this.id,
    this.name,
    this.address,
    this.email,
    this.motorNo,
  });

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['address'] = address;

    map['email'] = email;

    map['motorNo'] = motorNo;

    return map;
  }

  factory Profilemodel.fromMap(Map<String, dynamic> map) {
    return Profilemodel.withId(
      id: map['id'],
      name: map['name'],
      address: map['address'],
      email: map['email'],
      motorNo: map['motorNo'],
    );
  }
}
