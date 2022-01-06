import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/screen/signup/location.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpLoadAvatarController extends GetxController with StateMixin {
  RxString filePath = "".obs;
  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.empty());
  }

  Future<void> getFromGallery() async {
    XFile? pickfile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickfile != null) {
      filePath.value = pickfile.path;
      change(null, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.empty());
    }
  }

  void onChooseImage() {
    getFromGallery();
  }

  void onNext() {
    if (filePath.value.isNotEmpty) {
      Get.to(
        () => const LocationPick(),
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
        titleText: const Center(
            child: Text(
          "Hãy chọn ảnh nào !",
          style: TextStyle(
              fontSize: defautfontsize + 5, fontWeight: FontWeight.bold),
        )),
        animationDuration: const Duration(milliseconds: 200),
        duration: const Duration(milliseconds: 1500),
        isDismissible: true,
      );
    }
  }
}
