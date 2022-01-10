// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/model/addressmodel.dart';
import 'package:flutter_food_delivery_v1/model/foodmodel.dart';
import 'package:flutter_food_delivery_v1/model/restaurantmodel.dart';
import 'package:flutter_food_delivery_v1/service/fetchdata.dart';
import 'package:flutter_food_delivery_v1/service/location.dart';
import 'package:get/get.dart';

class RestaurantDetailsController extends GetxController with StateMixin {
  RxList<FoodModel> listFood = <FoodModel>[].obs;
  Rx<RestaurantModel> restaurant = RestaurantModel(
          "", "", TimeOfDay.now(), 0, "", 0, TimeOfDay.now(), Address(0, 0, ""))
      .obs;

  @override
  void onInit() {
    super.onInit();
    getAgrument();
    getListFood();
  }

  void getAgrument() {
    change(null, status: RxStatus.loading());
    restaurant.value = Get.arguments;
    change(null, status: RxStatus.success());
  }

  void getListFood() async {
    change(null, status: RxStatus.loading());
    RestaurantModel data = Get.arguments;
    listFood.value = await FetchData().getByRestaurantID(data.restaurantID);
    for (var item in listFood.value) {
      var distance = double.parse(((await LocationService().getDistancebetween(
                  data.restaurantAddress.lattitude,
                  data.restaurantAddress.longtitude) /
              1000)
          .toStringAsFixed(1)));
      item.foodSpace = distance;
      item.foodMinute = double.parse((distance / 40 + 10).toStringAsFixed(1));
    }
    change(null, status: RxStatus.success());
  }
}
