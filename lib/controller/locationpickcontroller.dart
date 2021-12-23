import 'package:flutter/animation.dart';
import 'package:flutter_food_delivery_v1/screen/map_pick/mappick.dart';
import 'package:get/get.dart';

class LocationPickController extends GetxController {
  void onChooseLocation() {
    Get.to(() => const MapPick(),
        transition: Transition.leftToRight,
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 200));
  }

  void onNext() {}
}
