// ignore_for_file: invalid_use_of_protected_member

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/model/foodmodel.dart';
import 'package:flutter_food_delivery_v1/model/restaurantmodel.dart';
import 'package:flutter_food_delivery_v1/screen/homescreen/homescreen.dart';
import 'package:flutter_food_delivery_v1/screen/shoppingcart/shoppingcartscreen.dart';
import 'package:flutter_food_delivery_v1/service/fetchdata.dart';
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
    Container(
      color: Colors.blue,
    )
  ];

  FetchData fetchData = FetchData();
  @override
  void onInit() {
    super.onInit();
    fetchRestaurant();
    fetchFood();
    fetchNearestFood();
  }

  void fetchRestaurant() async {
    change(null, status: RxStatus.loading());
    restaurant.value = await fetchData.fetchRestaurant();
    change(null, status: RxStatus.success());
  }

  void fetchFood() async {
    change(null, status: RxStatus.loading());
    Random random = Random();
    var restaurant = await fetchData.fetchRestaurant();
    for (var item in restaurant) {
      for (var fooditem in item.restaurantFood) {
        fooditem.foodSpace = random.nextInt(10) +
            double.parse(random.nextDouble().toStringAsFixed(1));
        fooditem.foodMinute = double.parse(
            (fooditem.foodSpace / 40 * 60 + 10).toStringAsFixed(1));
        food.add(fooditem);
      }
    }
    change(null, status: RxStatus.success());
  }

  void fetchNearestFood() async {
    change(null, status: RxStatus.loading());
    Random random = Random();
    var restaurant = await fetchData.fetchRestaurant();
    for (var item in restaurant) {
      for (var fooditem in item.restaurantFood) {
        fooditem.foodSpace = random.nextInt(10) +
            double.parse(random.nextDouble().toStringAsFixed(1));
        fooditem.foodMinute = double.parse(
            (fooditem.foodSpace / 40 * 60 + 10).toStringAsFixed(1));
        nearestFood.add(fooditem);
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
