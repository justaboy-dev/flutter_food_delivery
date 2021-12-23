import 'package:flutter_food_delivery_v1/model/foodmodel.dart';

class BillModel {
  String userID;
  String restaurantID;
  String driverID;
  String status;
  double cash;
  List<FoodModel> food;

  BillModel(this.userID, this.restaurantID, this.driverID, this.status,
      this.cash, this.food);
  factory BillModel.fromMap(Map<String, dynamic> map) {
    return BillModel(map["userID"], map["restaurantID"], map["driverID"],
        map["status"], map["cash"], map["food"]);
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "userID": userID,
      "restaurantID": restaurantID,
      "driverID": driverID,
      "status": status,
      "cash": cash,
      "food": food,
    };
  }
}
