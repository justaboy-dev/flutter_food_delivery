import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/controller/fillbiocontroller.dart';
import 'package:flutter_food_delivery_v1/controller/signupcontroller.dart';
import 'package:flutter_food_delivery_v1/controller/uploadavatarcontroller.dart';
import 'package:flutter_food_delivery_v1/model/addressmodel.dart';
import 'package:flutter_food_delivery_v1/model/usermodel.dart';
import 'package:flutter_food_delivery_v1/screen/map_pick/mappick.dart';
import 'package:flutter_food_delivery_v1/screen/signup/signupsuccess.dart';
import 'package:flutter_food_delivery_v1/service/authencation.dart';
import 'package:flutter_food_delivery_v1/service/getstorage.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationPickController extends GetxController with StateMixin {
  RxString address = "".obs;
  late Position result;

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.empty());
  }

  void onChooseLocation() async {
    result = await Get.to(() => const MapPick(),
        transition: Transition.leftToRight,
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 200));

    List<Placemark> fullAddress =
        await placemarkFromCoordinates(result.latitude, result.longitude);

    address.value = fullAddress[0].subThoroughfare.toString() +
        ", " +
        fullAddress[0].thoroughfare.toString() +
        ", " +
        fullAddress[0].subAdministrativeArea.toString() +
        ", " +
        fullAddress[0].administrativeArea.toString();
    change(null, status: RxStatus.success());
  }

  void onNext() async {
    if (address.value.isNotEmpty) {
      var signup = Get.find<SignUpController>();
      var fillbio = Get.find<FillBioController>();
      var avatar = Get.find<UpLoadAvatarController>();
      var user = UserModel(
          "",
          fillbio.firstname.text,
          fillbio.lastname.text,
          signup.passwordController.text,
          signup.phonenumberController.text,
          base64Encode(File(avatar.filePath.value).readAsBytesSync()),
          signup.isDriver.value,
          Address(result.latitude, result.longitude, address.value));

      Response respon = await Authencation().signUp(user);
      Get.snackbar(
        "",
        "",
        icon: Icon(
          respon.statusCode == 201 ? Icons.check_box_outlined : Icons.error,
          color: respon.statusCode == 201 ? Colors.green : Colors.red,
          size: 50,
        ),
        padding: const EdgeInsets.only(left: 20, top: 30),
        titleText: Center(
            child: Text(
          respon.body["message"].toString(),
          style: const TextStyle(
              fontSize: defautfontsize + 5, fontWeight: FontWeight.bold),
        )),
        animationDuration: const Duration(milliseconds: 200),
        isDismissible: true,
        duration: const Duration(milliseconds: 1500),
      );
      if (respon.statusCode == 201) {
        GetStorageService().writeIsLogin(true);
        Get.offAll(
          () => const SignUpSuccess(),
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          transition: Transition.rightToLeftWithFade,
        );
      }
    }
  }
}
