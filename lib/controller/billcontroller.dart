// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/model/addressmodel.dart';
import 'package:flutter_food_delivery_v1/model/billmodel.dart';
import 'package:flutter_food_delivery_v1/model/billviewmodel.dart';
import 'package:flutter_food_delivery_v1/model/restaurantmodel.dart';
import 'package:flutter_food_delivery_v1/service/fetchdata.dart';
import 'package:get/get.dart';

class BillController extends GetxController with StateMixin {
  RxList<BillViewModel> listbillview = <BillViewModel>[].obs;
  Rx<RestaurantModel> restaurant = RestaurantModel(
          "", "", TimeOfDay.now(), 0, "", 0, TimeOfDay.now(), Address(0, 0, ""))
      .obs;

  void onLoadBill() async {
    change(null, status: RxStatus.loading());
    List<BillModel> listbill = await FetchData().fetchBill();
    listbill = listbill.reversed.toList();
    for (var item in listbill) {
      var res = await FetchData().getRestaurantByID(item.restaurantID);
      listbillview.value.add(BillViewModel(
          item.billId.toString(),
          res.restaurantName,
          res.restaurantImage,
          item.foodID.length,
          item.cash,
          item.status));
    }
    change(null, status: RxStatus.success());
  }

  @override
  void onInit() {
    super.onInit();
    onLoadBill();
  }

  void getRestaurant(BillModel bill) async {
    restaurant.value = await FetchData().getRestaurantByID(bill.restaurantID);
  }
}
