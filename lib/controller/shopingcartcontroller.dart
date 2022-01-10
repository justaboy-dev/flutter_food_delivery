// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/controller/billcontroller.dart';
import 'package:flutter_food_delivery_v1/controller/homescreencontroller.dart';
import 'package:flutter_food_delivery_v1/controller/ordersreen.dart';
import 'package:flutter_food_delivery_v1/model/billmodel.dart';
import 'package:flutter_food_delivery_v1/model/foodmodel.dart';
import 'package:flutter_food_delivery_v1/screen/orderscreen/orderscreen.dart';
import 'package:flutter_food_delivery_v1/service/fetchdata.dart';
import 'package:flutter_food_delivery_v1/service/getstorage.dart';
import 'package:get/get.dart';
import 'package:objectid/objectid.dart';

class ShoppingCartController extends GetxController with StateMixin {
  RxDouble total = 0.0.obs;
  RxList<FoodModel> listFood = <FoodModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    listFood.clear();
    loadShopingCart();
  }

  void loadShopingCart() {
    change(null, status: RxStatus.loading());
    var list = GetStorageService().getFromStorage();
    if (list.isEmpty) {
      listFood.clear();
      change(null, status: RxStatus.empty());
    } else {
      listFood.value = list;
      updateTotal();
      change(null, status: RxStatus.success());
    }
  }

  void onDissmissed(FoodModel food) {
    change(null, status: RxStatus.loading());
    listFood.value.removeWhere((element) => element.foodID == food.foodID);
    GetStorageService().pushToStorage(listFood.value);
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
    if (amount < 2) {
      onDissmissed(food);
    } else {
      listFood.value
          .where((element) => element.foodID == food.foodID)
          .first
          .foodAmount--;
      GetStorageService().pushToStorage(listFood.value);
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
    var listItem = GetStorageService().getFromStorage();
    var isExist =
        listItem.firstWhereOrNull((element) => element.foodID == food.foodID);
    if (isExist == null) {
      listItem.add(food);
    } else {
      listItem
          .firstWhere((element) => element.foodID == food.foodID)
          .foodAmount++;
    }
    GetStorageService().pushToStorage(listItem);
    loadShopingCart();
    HomeScreenController controller = Get.find<HomeScreenController>();
    controller.getNumberOfItem();
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
      animationDuration: const Duration(milliseconds: 200),
      isDismissible: true,
      duration: const Duration(milliseconds: 1500),
    );
    change(null, status: RxStatus.success());
  }

  void onBooking() async {
    var listFood = GetStorageService().getFromStorage();
    List<FoodId> list = [];
    double cash = 0;
    for (var element in listFood) {
      cash += (element.foodPrice * element.foodAmount);
      list.add(FoodId(element.foodID, element.foodAmount));
    }

    var user = GetStorageService().readUser();
    BillModel bill = BillModel(ObjectId().hexString, user.userID.toString(),
        listFood[0].restaurantID, "", "Booking", cash, list, 0);
    var success = await FetchData().postBill(bill);
    if (success) {
      await Get.to(() => const OrderScreen(),
          arguments: bill.billId,
          curve: Curves.fastOutSlowIn,
          duration: const Duration(milliseconds: 300),
          transition: Transition.rightToLeftWithFade);
      Get.delete<OrderScreenController>();
      GetStorageService().earaserStorage();
      loadShopingCart();
      HomeScreenController controller = Get.find<HomeScreenController>();
      BillController billController = Get.find<BillController>();
      billController.onLoadBill();
      controller.getNumberOfItem();
    }
  }
}
