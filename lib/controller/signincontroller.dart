import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/screen/mainscreen/mainscreen.dart';
import 'package:flutter_food_delivery_v1/service/authencation.dart';
import 'package:flutter_food_delivery_v1/service/getstorage.dart';
import 'package:get/get.dart';

class SignInController extends GetxController with StateMixin {
  Rx<String> phoneNumber = "".obs;
  Rx<String> password = "".obs;
  final formState = GlobalKey<FormState>();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.success());
  }

  void onLogin() async {
    change(null, status: RxStatus.loading());
    if (formState.currentState!.validate()) {
      Response res = await Authencation()
          .signIn(phoneNumberController.text, passwordController.text);
      if (jsonDecode(res.bodyString.toString())["success"] as bool) {
        GetStorageService().writeIsLogin(true);
        Get.offAll(() => const HomePageSreen(),
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            transition: Transition.zoom);
      } else {
        Get.snackbar(
          "",
          "",
          icon: const Icon(
            Icons.error,
            color: Colors.red,
            size: 50,
          ),
          padding: const EdgeInsets.only(left: 20, top: 30),
          titleText: Center(
              child: Text(
            jsonDecode(res.bodyString.toString())["message"],
            style: const TextStyle(
                fontSize: defautfontsize + 5, fontWeight: FontWeight.bold),
          )),
          animationDuration: const Duration(milliseconds: 200),
          duration: const Duration(milliseconds: 1500),
          isDismissible: true,
        );
      }
    }
    change(null, status: RxStatus.success());
  }

  void onForgotPass() {}
}
