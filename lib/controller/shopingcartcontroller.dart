// ignore_for_file: invalid_use_of_protected_member

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/model/foodmodel.dart';
import 'package:flutter_food_delivery_v1/service/fetchdata.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ShoppingCartController extends GetxController with StateMixin {
  RxDouble total = 0.0.obs;
  RxList<FoodModel> listFood = <FoodModel>[].obs;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadShopingCart();
  }

  void loadShopingCart() {
    change(null, status: RxStatus.loading());
    var list = getFromStorage();
    if (list.isEmpty) {
      change(null, status: RxStatus.empty());
    } else {
      listFood.value = list;
      updateTotal();
      change(null, status: RxStatus.success());
    }
  }

  List<FoodModel> getFromStorage() {
    var item = box.read("listShoppingCart");
    List<FoodModel> listFoodFromStorage = [];
    if (item == null) {
      return listFoodFromStorage;
    } else {
      dynamic decode = jsonDecode(item);
      listFoodFromStorage =
          decode.map<FoodModel>((e) => FoodModel.fromMap(e)).toList();
    }
    return listFoodFromStorage;
  }

  void pushToStorage(List<FoodModel> pushItem) {
    box.write("listShoppingCart",
        jsonEncode(pushItem.map((e) => e.toMap()).toList()));
  }

  void onDissmissed(FoodModel food) {
    change(null, status: RxStatus.loading());
    listFood.value.removeWhere((element) => element.foodID == food.foodID);
    pushToStorage(listFood.value);
    updateTotal();
    listFood.value.isEmpty
        ? change(null, status: RxStatus.empty())
        : change(null, status: RxStatus.success());
  }

  void onMinus(FoodModel food) {
    change(null, status: RxStatus.loading());
    var amount = listFood.value
        .where((element) => element.foodID == food.foodID)
        .first
        .foodAmount;
    if (amount == 1) {
      onDissmissed(food);
    } else {
      listFood.value
          .where((element) => element.foodID == food.foodID)
          .first
          .foodAmount--;
      pushToStorage(listFood.value);
      updateTotal();
    }
    listFood.value.isEmpty
        ? change(null, status: RxStatus.empty())
        : change(null, status: RxStatus.success());
  }

  void onPlus(FoodModel food) {
    change(null, status: RxStatus.loading());
    listFood.value
        .where((element) => element.foodID == food.foodID)
        .first
        .foodAmount++;
    updateTotal();
    change(null, status: RxStatus.success());
  }

  void updateTotal() {
    change(null, status: RxStatus.loading());
    var value = 0.0;
    for (var item in listFood.value) {
      value += (item.foodAmount * item.foodPrice);
    }
    total.value = value;
    change(null, status: RxStatus.success());
  }

  void onAdd(FoodModel food) {
    change(null, status: RxStatus.loading());
    var listItem = getFromStorage();
    var isExist =
        listItem.firstWhereOrNull((element) => element.foodID == food.foodID);
    if (isExist == null) {
      listItem.add(food);
    } else {
      listItem
          .firstWhere((element) => element.foodID == food.foodID)
          .foodAmount++;
    }
    pushToStorage(listItem);
    final shoppingCartController = Get.find<ShoppingCartController>();
    shoppingCartController.loadShopingCart();
    Get.snackbar(
      "",
      "",
      icon: const Icon(
        Icons.check_box_rounded,
        color: primaryColor,
        size: 50,
      ),
      padding: const EdgeInsets.only(left: 20, top: 30),
      titleText: const Center(
          child: Text(
        "Đã thêm vào giỏ hàng",
        style: TextStyle(
            fontSize: defautfontsize + 5, fontWeight: FontWeight.bold),
      )),
      animationDuration: const Duration(milliseconds: 300),
      isDismissible: true,
    );
    change(null, status: RxStatus.success());
  }
}
