class Address {
  double longtitude;
  double lattitude;
  String fullAddress;

  Address(this.lattitude, this.longtitude, this.fullAddress);
  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(map["longtitude"], map["lattitude"], map["fullAddress"]);
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "lattitude": lattitude,
      "longtitude": longtitude,
      "fullAddress": fullAddress,
    };
  }
}
