// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/model/foodmodel.dart';
import 'package:flutter_food_delivery_v1/model/restaurantmodel.dart';
import 'package:flutter_food_delivery_v1/screen/homescreen/homescreen.dart';
import 'package:flutter_food_delivery_v1/screen/settings/settingscreen.dart';
import 'package:flutter_food_delivery_v1/screen/shoppingcart/shoppingcartscreen.dart';
import 'package:flutter_food_delivery_v1/service/fetchdata.dart';
import 'package:flutter_food_delivery_v1/service/location.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController with StateMixin {
  RxList<RestaurantModel> restaurant = <RestaurantModel>[].obs;
  RxList<FoodModel> food = <FoodModel>[].obs;
  RxList<FoodModel> nearestFood = <FoodModel>[].obs;
  RxInt currentIndex = 0.obs;
  TextEditingController findController = TextEditingController();
  ScrollController scrollController = ScrollController();

  List<Widget> screen = [
    const HomePage(),
    Container(
      color: Colors.green,
    ),
    const ShoppingCartScreen(),
    const SettingScreen()
  ];

  FetchData fetchData = FetchData();
  @override
  void onInit() {
    super.onInit();
    currentIndex.value = 0;
    fetchRestaurant();
    fetchFood();
    fetchNearestFood();
  }

  void fetchRestaurant() async {
    change(null, status: RxStatus.loading());
    restaurant.value = await fetchData.fetchRestaurant();
    for (var item in restaurant.value) {
      item.restaurantSpace = double.parse(((await LocationService()
                  .getDistancebetween(item.restaurantAddress.lattitude,
                      item.restaurantAddress.longtitude) /
              1000)
          .toStringAsFixed(1)));
      for (var foodItem in item.restaurantFood) {
        foodItem.foodSpace = item.restaurantSpace;
        foodItem.foodMinute =
            double.parse((item.restaurantSpace / 40 + 10).toStringAsFixed(1));
        food.value.add(foodItem);
      }
    }
    change(null, status: RxStatus.success());
  }

  void fetchFood() async {
    change(null, status: RxStatus.loading());
    var res = await fetchData.fetchRestaurant();
    for (var item in res) {
      var distance = double.parse(((await LocationService().getDistancebetween(
                  item.restaurantAddress.lattitude,
                  item.restaurantAddress.longtitude) /
              1000)
          .toStringAsFixed(1)));
      for (var foodItem in item.restaurantFood) {
        foodItem.foodSpace = distance;
        foodItem.foodMinute =
            double.parse((distance / 40 + 10).toStringAsFixed(1));
        food.value.add(foodItem);
      }
    }
    change(null, status: RxStatus.success());
  }

  void fetchNearestFood() async {
    change(null, status: RxStatus.loading());
    var res = await fetchData.fetchRestaurant();
    for (var item in res) {
      var distance = double.parse(((await LocationService().getDistancebetween(
                  item.restaurantAddress.lattitude,
                  item.restaurantAddress.longtitude) /
              1000)
          .toStringAsFixed(1)));
      for (var foodItem in item.restaurantFood) {
        foodItem.foodSpace = distance;
        foodItem.foodMinute =
            double.parse((distance / 40 + 10).toStringAsFixed(1));
        nearestFood.value.add(foodItem);
      }
    }
    nearestFood.sort((a, b) => a.foodSpace.compareTo(b.foodSpace));
    change(null, status: RxStatus.success());
  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  void onSearchBarTap() {
    if (scrollController.offset < 120) {
      scrollController.animateTo(120,
          duration: const Duration(milliseconds: 600),
          curve: Curves.fastOutSlowIn);
    }
  }
}
