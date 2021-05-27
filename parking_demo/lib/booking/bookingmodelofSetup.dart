class BusinessProfilemodel {
  int id;
  String name;
  String address;

  String email;

  String businessType;
  // 0 - Incomplete, 1 - Complete

  BusinessProfilemodel({
    this.name,
    this.address,
    this.email,
    this.businessType,
  });
  BusinessProfilemodel.withId({
    this.id,
    this.name,
    this.address,
    this.email,
    this.businessType,
  });

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['address'] = address;

    map['email'] = email;

    map['businessType'] = businessType;

    return map;
  }

  factory BusinessProfilemodel.fromMap(Map<String, dynamic> map) {
    return BusinessProfilemodel.withId(
      id: map['id'],
      name: map['name'],
      address: map['address'],
      email: map['email'],
      businessType: map['businessType'],
    );
  }
}
