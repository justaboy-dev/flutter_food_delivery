// ignore_for_file: invalid_use_of_protected_member

import 'package:elastic_client/elastic_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/controller/billcontroller.dart';
import 'package:flutter_food_delivery_v1/controller/shopingcartcontroller.dart';
import 'package:flutter_food_delivery_v1/model/foodmodel.dart';
import 'package:flutter_food_delivery_v1/model/restaurantmodel.dart';
import 'package:flutter_food_delivery_v1/screen/billsreen.dart/billscreen.dart';
import 'package:flutter_food_delivery_v1/screen/homescreen/homescreen.dart';
import 'package:flutter_food_delivery_v1/screen/searchscreen/searchsreen.dart';
import 'package:flutter_food_delivery_v1/screen/settings/settingscreen.dart';
import 'package:flutter_food_delivery_v1/screen/shoppingcart/shoppingcartscreen.dart';
import 'package:flutter_food_delivery_v1/service/elasticsearch.dart';
import 'package:flutter_food_delivery_v1/service/fetchdata.dart';
import 'package:flutter_food_delivery_v1/service/location.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController with StateMixin {
  RxList<RestaurantModel> restaurant = <RestaurantModel>[].obs;
  RxList<FoodModel> food = <FoodModel>[].obs;
  RxList<FoodModel> nearestFood = <FoodModel>[].obs;
  RxInt currentIndex = 0.obs;
  RxInt numberOfItem = 0.obs;
  TextEditingController findController = TextEditingController();
  ShoppingCartController shoppingCartController =
      Get.put(ShoppingCartController());
  ScrollController scrollController = ScrollController();

  BillController billController = Get.put(BillController());

  List<Widget> screen = [
    const HomePage(),
    const BillScreen(),
    const ShoppingCartScreen(),
    const SettingScreen()
  ];

  FetchData fetchData = FetchData();
  @override
  void onInit() {
    super.onInit();
    initAll();
  }

  void initAll() async {
    currentIndex.value = 0;
    fetchRestaurant();
    fetchFood();
    fetchNearestFood();
    getNumberOfItem();
  }

  void getNumberOfItem() {
    numberOfItem.value = shoppingCartController.listFood.length;
    change(null, status: RxStatus.success());
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
      change(null, status: RxStatus.success());
    }
  }

  void fetchFood() async {
    change(null, status: RxStatus.loading());
    var fetchfood = await fetchData.fetchFood();
    for (var item in fetchfood) {
      var res = await fetchData.getByFoodID(item.foodID);
      var distance = double.parse(((await LocationService().getDistancebetween(
                  res.restaurantAddress.lattitude,
                  res.restaurantAddress.longtitude) /
              1000)
          .toStringAsFixed(1)));
      item.foodSpace = distance;
      item.foodMinute = double.parse((distance / 40 + 10).toStringAsFixed(1));
      food.value.add(item);
    }
    change(null, status: RxStatus.success());
  }

  void fetchNearestFood() async {
    change(null, status: RxStatus.loading());
    var fetchfood = await fetchData.fetchFood();
    for (var item in fetchfood) {
      var res = await fetchData.getByFoodID(item.foodID);
      var distance = double.parse(((await LocationService().getDistancebetween(
                  res.restaurantAddress.lattitude,
                  res.restaurantAddress.longtitude) /
              1000)
          .toStringAsFixed(1)));
      item.foodSpace = distance;
      item.foodMinute = double.parse((distance / 40 + 10).toStringAsFixed(1));
      nearestFood.value.add(item);
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

  void onSearchBarSubmit() async {
    if (findController.text.isNotEmpty) {
      SearchResult listSearch =
          await ElasticService().getRecord(findController.text);
      Get.to(() => const SearchSreen(),
          arguments: listSearch,
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          transition: Transition.leftToRightWithFade);
      findController.clear();
    }
  }
}
