import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  Rx<String> phoneNumber = "".obs;
  Rx<String> password = "".obs;
  final formState = GlobalKey<FormState>();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void onLogin() {
    if (formState.currentState!.validate()) {
      print("object");
    }
  }

  void onForgotPass() {}
}
