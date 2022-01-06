import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/screen/signup/uploadavatar.dart';
import 'package:get/get.dart';

class FillBioController extends GetxController {
  Rx<String> fullname = "".obs;
  Rx<String> emailAddress = "".obs;
  final formKey = GlobalKey<FormState>();
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();

  void onNext() {
    if (formKey.currentState!.validate()) {
      Get.to(
        () => const UploadAvatar(),
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        transition: Transition.rightToLeftWithFade,
      );
    }
  }
}
