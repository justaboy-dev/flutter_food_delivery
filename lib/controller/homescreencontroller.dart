// ignore_for_file: invalid_use_of_protected_member

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/model/foodmodel.dart';
import 'package:flutter_food_delivery_v1/model/restaurantmodel.dart';
import 'package:flutter_food_delivery_v1/service/fetchdata.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController with StateMixin {
  RxList<RestaurantModel> restaurant = <RestaurantModel>[].obs;
  RxList<FoodModel> food = <FoodModel>[].obs;
  RxList<FoodModel> nearestFood = <FoodModel>[].obs;
  RxInt currentIndex = 0.obs;
  TextEditingController findController = TextEditingController();
  ScrollController scrollController = ScrollController();

  FetchData fetchData = FetchData();
  @override
  void onInit() {
    super.onInit();
    fetchRestaurant();
    fetchFood();
    //fetchNearestFood();
  }

  void fetchRestaurant() async {
    change(null, status: RxStatus.loading());
    restaurant.value = await fetchData.fetchRestaurant();
    change(null, status: RxStatus.success());
  }

  void fetchFood() async {
    change(null, status: RxStatus.loading());
    var restaurant = await fetchData.fetchRestaurant();
    for (var item in restaurant) {
      food.value += item.restaurantFood;
      nearestFood.value += item.restaurantFood;
    }
    //print(food.value[0]);
    change(null, status: RxStatus.success());
  }

  void fetchNearestFood() async {
    change(null, status: RxStatus.loading());
    var restaurant = await fetchData.fetchRestaurant();
    for (var item in restaurant) {
      nearestFood.value += item.restaurantFood;
    }
    double space = 5;
    Random random = Random();
    for (var item in nearestFood.value) {
      item.foodSpace = space + random.nextDouble();
    }
    nearestFood.sort((a, b) => a.foodSpace.compareTo(b.foodSpace));
    change(null, status: RxStatus.success());
  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  void onOpenMenuBar() {
    Get.bottomSheet(
      Container(
        color: Colors.red,
      ),
    );
  }

  void onSearchBarTap() {
    if (scrollController.offset < 120) {
      scrollController.animateTo(120,
          duration: const Duration(milliseconds: 600),
          curve: Curves.fastOutSlowIn);
    }
  }
}
