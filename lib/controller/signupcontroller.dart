import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/screen/signup/fillbio.dart';
import 'package:flutter_food_delivery_v1/service/authencation.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  Rx<String> username = "".obs;
  Rx<String> phoneNumber = "".obs;
  Rx<String> password = "".obs;
  final formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();

  void onSignUp() async {
    if (formKey.currentState!.validate()) {
      Response response =
          await Authencation().checkExitPhoneNumber(phonenumberController.text);
      if (response.statusCode == 200) {
        Get.to(
          () => const FillBioScreen(),
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          transition: Transition.rightToLeftWithFade,
        );
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
            response.body["message"],
            style: const TextStyle(
                fontSize: defautfontsize + 5, fontWeight: FontWeight.bold),
          )),
          animationDuration: const Duration(milliseconds: 200),
          isDismissible: true,
          duration: const Duration(milliseconds: 1500),
        );
      }
    }
  }
}
