// ignore_for_file: invalid_use_of_protected_member

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/controller/homescreencontroller.dart';
import 'package:flutter_food_delivery_v1/model/addressmodel.dart';
import 'package:flutter_food_delivery_v1/model/billmodel.dart';
import 'package:flutter_food_delivery_v1/model/usermodel.dart';
import 'package:flutter_food_delivery_v1/screen/mainscreen/mainscreen.dart';
import 'package:flutter_food_delivery_v1/service/authencation.dart';
import 'package:flutter_food_delivery_v1/service/fetchdata.dart';
import 'package:flutter_food_delivery_v1/service/getstorage.dart';
import 'package:get/get.dart';

class OrderScreenController extends GetxController with StateMixin {
  RxInt billStatus = 1.obs;
  String billId = Get.arguments;
  late Timer _timer;
  Rx<BillModel> fetchbill = BillModel("", "", "", "", "", 0, [], 0).obs;

  Map statusmap = {
    "Booking": 1,
    "Booked": 2,
    "Shipping": 3,
    "Delivered": 4,
    "Cancel": 0,
  };

  Rx<UserModel> driver =
      UserModel("null", "", "", "", "", "", false, Address(0, 0, "")).obs;
  Rx<UserModel> user =
      UserModel("", "", "", "", "", "", false, Address(0, 0, "")).obs;

  @override
  void onInit() {
    super.onInit();
    getData();
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) async {
      getStatus();
      getDriver();
    });
  }

  @override
  void onClose() {
    super.onClose();
    _timer.cancel();
  }

  void getData() async {
    user.value = GetStorageService().readUser();
  }

  void getDriver() async {
    if (driver.value.userID == "null") {
      if (fetchbill.value.driverID != "") {
        driver.value = await Authencation()
            .getUserByID(fetchbill.value.driverID.toString());
        change(driver.value, status: RxStatus.success());
      }
    }
  }

  void getStatus() async {
    if (billStatus.value != 0 && billStatus.value != 4) {
      fetchbill.value = await FetchData().getBillByID(billId.toString());
      billStatus.value = statusmap[fetchbill.value.status];
      change(billStatus.value, status: RxStatus.success());
    }
  }

  void complete() {
    HomeScreenController controller = Get.find();
    controller.initAll();
    Get.off(() => const HomePageSreen(),
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        transition: Transition.zoom,
        arguments: fetchbill.value);
  }
}
