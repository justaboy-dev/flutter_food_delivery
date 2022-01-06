import 'package:flutter_food_delivery_v1/model/addressmodel.dart';

class UserModel {
  String? userID = "";
  String? firstname;
  String? lastname;
  String? userPasswordHash;
  String? phoneNumber;
  String? avatarUrl;
  bool? role;
  Address? address;

  UserModel(this.userID, this.firstname, this.lastname, this.userPasswordHash,
      this.phoneNumber, this.avatarUrl, this.role, this.address);
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        map["_id"],
        map["FirstName"],
        map["LastName"],
        map["Password"],
        map["PhoneNumber"],
        map["Avatar"],
        map["isDriver"],
        Address.fromMap(map["address"]));
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "_id": userID,
      "FirstName": firstname,
      "LastName": lastname,
      "Password": userPasswordHash,
      "PhoneNumber": phoneNumber,
      "Avatar": avatarUrl,
      "isDriver": role,
      "address": address!.toMap(),
    };
  }
}
