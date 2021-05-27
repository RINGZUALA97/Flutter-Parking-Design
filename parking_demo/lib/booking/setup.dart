class Setup {
  int id;
  int setupStatus;
  Setup({
    this.setupStatus,
  });
  Setup.withId({this.id, this.setupStatus});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }

    map['setupStatus'] = setupStatus;

    return map;
  }

  factory Setup.fromMap(Map<String, dynamic> map) {
    return Setup.withId(
      id: map['id'],
      setupStatus: map['setupStatus'],
    );
  }
}
