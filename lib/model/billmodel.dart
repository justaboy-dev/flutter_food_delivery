import 'package:flutter_food_delivery_v1/model/foodmodel.dart';

class BillModel {
  String userID;
  String restaurantID;
  String driverID;
  String status;
  double cash;
  double rate;
  List<FoodModel> food;

  BillModel(this.userID, this.restaurantID, this.driverID, this.status,
      this.cash, this.food, this.rate);
  factory BillModel.fromMap(Map<String, dynamic> map) {
    return BillModel(map["userID"], map["restaurantID"], map["driverID"],
        map["status"], map["cash"], map["food"], map["rate"]);
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "userID": userID,
      "restaurantID": restaurantID,
      "driverID": driverID,
      "status": status,
      "cash": cash,
      "food": food,
      "rate": rate,
    };
  }
}
