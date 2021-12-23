import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/model/foodmodel.dart';

class RestaurantModel {
  String restaurantID;
  String restaurantName;
  String restaurantImage;
  TimeOfDay restaurantOpenTime;
  double restaurantRate;
  double restaurantSpace;
  List<FoodModel> restaurantFood;

  RestaurantModel(
      this.restaurantID,
      this.restaurantName,
      this.restaurantOpenTime,
      this.restaurantRate,
      this.restaurantFood,
      this.restaurantImage,
      this.restaurantSpace);
  factory RestaurantModel.fromMap(Map<String, dynamic> map) {
    return RestaurantModel(
        map["restaurantID"],
        map["restaurantName"],
        map["restaurantOpenTime"],
        map["restaurantRate"],
        map["restaurantFood"],
        map["restaurantImage"],
        map["restaurantSpace"]);
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "restaurantID": restaurantID,
      "restaurantName": restaurantName,
      "restaurantOpenTime": restaurantOpenTime,
      "restaurantRate": restaurantRate,
      "restaurantFood": restaurantFood,
      "restaurantImage": restaurantImage,
      "restaurantSpace": restaurantSpace,
    };
  }
}
