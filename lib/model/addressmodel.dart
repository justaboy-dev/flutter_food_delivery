class Address {
  double longtitude;
  double lattitude;
  String fullAddress;

  Address(this.lattitude, this.longtitude, this.fullAddress);
  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(double.parse(map["lat"].toString()),
        double.parse(map["long"].toString()), map["fullAddress"]);
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "lat": lattitude,
      "long": longtitude,
      "fullAddress": fullAddress,
    };
  }
}
