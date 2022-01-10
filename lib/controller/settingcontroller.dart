import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/controller/mappickcontroller.dart';
import 'package:flutter_food_delivery_v1/controller/mapscreencontroller.dart';
import 'package:flutter_food_delivery_v1/model/addressmodel.dart';
import 'package:flutter_food_delivery_v1/model/usermodel.dart';
import 'package:flutter_food_delivery_v1/screen/map_pick/mappick.dart';
import 'package:flutter_food_delivery_v1/screen/welcome/welcome.dart';
import 'package:flutter_food_delivery_v1/service/authencation.dart';
import 'package:flutter_food_delivery_v1/service/getstorage.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SettingController extends GetxController with StateMixin {
  Rx<UserModel> user =
      UserModel("", "", "", "", "", "", false, Address(0, 0, "")).obs;
  void onLogout() {
    GetStorageService().writeIsLogin(false);
    GetStorageService().writeFirstLogin(false);
    Get.deleteAll();
    Get.offAll(() => const WelComeScreen(),
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        transition: Transition.zoom);
  }

  void loadUser() {
    change(null, status: RxStatus.loading());
    user.value = GetStorageService().readUser();
    change(null, status: RxStatus.success());
  }

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  void onChangeAvatar() async {
    XFile? pickfile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickfile != null) {
      user.value.avatarUrl =
          base64Encode(File(pickfile.path).readAsBytesSync());
      GetStorageService().writeUser(user.value);
      loadUser();
      bool value = await Authencation().updateUser(user.value);
      if (value) {
        Get.snackbar(
          "",
          "",
          icon: const Icon(
            Icons.check_box_outlined,
            color: Colors.green,
            size: 50,
          ),
          padding: const EdgeInsets.only(left: 20, top: 30),
          titleText: const Center(
              child: Text(
            "Thay đổi thành công",
            style: TextStyle(
                fontSize: defautfontsize + 5, fontWeight: FontWeight.bold),
          )),
          animationDuration: const Duration(milliseconds: 200),
          isDismissible: true,
          duration: const Duration(milliseconds: 1500),
        );
      }
    }
  }

  void onChangedAddress() async {
    var pos = await Get.to(() => const MapPick(),
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 400),
        transition: Transition.rightToLeftWithFade);
    if (pos != null) {
      List<Placemark> fullAddress =
          await placemarkFromCoordinates(pos.latitude, pos.longitude);

      var address = fullAddress[0].subThoroughfare.toString() +
          ", " +
          fullAddress[0].thoroughfare.toString() +
          ", " +
          fullAddress[0].subAdministrativeArea.toString() +
          ", " +
          fullAddress[0].administrativeArea.toString();
      user.value.address = Address(pos.latitude, pos.longitude, address);

      bool value = await Authencation().updateUser(user.value);
      if (value) {
        Get.snackbar(
          "",
          "",
          icon: const Icon(
            Icons.check_box_outlined,
            color: Colors.green,
            size: 50,
          ),
          padding: const EdgeInsets.only(left: 20, top: 30),
          titleText: const Center(
              child: Text(
            "Thay đổi thành công",
            style: TextStyle(
                fontSize: defautfontsize + 5, fontWeight: FontWeight.bold),
          )),
          animationDuration: const Duration(milliseconds: 200),
          isDismissible: true,
          duration: const Duration(milliseconds: 1500),
        );
      }
    }
    Get.delete<MappickController>();
  }
}
