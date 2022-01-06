import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/model/addressmodel.dart';
import 'package:flutter_food_delivery_v1/model/foodmodel.dart';

class RestaurantModel {
  String restaurantID;
  String restaurantName;
  String restaurantImage;
  TimeOfDay restaurantOpenTime;
  TimeOfDay restaurantCloseTime;
  double restaurantRate;
  double restaurantSpace;
  List<FoodModel> restaurantFood;
  Address restaurantAddress;

  RestaurantModel(
      this.restaurantID,
      this.restaurantName,
      this.restaurantOpenTime,
      this.restaurantRate,
      this.restaurantFood,
      this.restaurantImage,
      this.restaurantSpace,
      this.restaurantCloseTime,
      this.restaurantAddress);
  factory RestaurantModel.fromMap(Map<String, dynamic> map) {
    return RestaurantModel(
        map["_id"].toString(),
        map["Name"].toString(),
        TimeOfDay(
            hour: int.parse(map["Opentime"].split(":")[0]),
            minute: int.parse(map["Opentime"].split(":")[1])),
        double.parse(map["Rate"].toString()),
        List<FoodModel>.from(
            map["Food"].map((item) => FoodModel.fromMap(item)).toList()),
        map["Image"],
        double.parse(map["Space"].toString()),
        TimeOfDay(
            hour: int.parse(map["Closetime"].split(":")[0]),
            minute: int.parse(map["Closetime"].split(":")[1])),
        Address.fromMap(map["address"]));
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "_id": restaurantID,
      "Name": restaurantName,
      "Opentime": restaurantOpenTime.hour.toString() +
          ":" +
          restaurantOpenTime.minute.toString(),
      "Rate": restaurantRate,
      "Food": restaurantFood,
      "Image": restaurantImage,
      "Space": restaurantSpace,
      "Closetime": restaurantCloseTime.hour.toString() +
          ":" +
          restaurantCloseTime.minute.toString(),
      "restaurantAddress": restaurantAddress,
    };
  }
}
