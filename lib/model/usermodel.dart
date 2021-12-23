import 'package:flutter_food_delivery_v1/model/addressmodel.dart';

class UserModel {
  String userID;
  String firstname;
  String lastname;
  String userPasswordHash;
  String phoneNumber;
  String avatarUrl;
  bool role;
  Address address;

  UserModel(this.userID, this.firstname, this.lastname, this.userPasswordHash,
      this.phoneNumber, this.avatarUrl, this.role, this.address);
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        map["userID"],
        map["firstname"],
        map["lastname"],
        map["userPasswordHash"],
        map["phoneNumber"],
        map["avatarUrl"],
        map["role"],
        map["address"]);
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "userID": userID,
      "firstname": firstname,
      "lastname": lastname,
      "userPasswordHash": userPasswordHash,
      "phoneNumber": phoneNumber,
      "avatarUrl": avatarUrl,
      "role": role,
      "address": address,
    };
  }
}
