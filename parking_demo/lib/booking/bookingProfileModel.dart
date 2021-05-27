class BookingProfiles {
  int id;
  String username;
  String vehicleType;
  String vehicleNo;
  String email;

  BookingProfiles(
      {this.username, this.vehicleNo, this.vehicleType, this.email});
  BookingProfiles.withId(
      {this.id, this.username, this.vehicleNo, this.vehicleType, this.email});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['name'] = username;
    map['vehicleNumber'] = vehicleNo;
    map['vehicleType'] = vehicleType;

    map['email'] = email;

    return map;
  }

  factory BookingProfiles.fromMap(Map<String, dynamic> map) {
    return BookingProfiles.withId(
      id: map['id'],
      username: map['name'],
      vehicleNo: map['VehicleNumber'],
      vehicleType: map['vehicleType'],
      email: map['email'],
    );
  }
}
