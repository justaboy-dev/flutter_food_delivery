import 'package:flutter/cupertino.dart';
import 'package:flutter_food_delivery_v1/screen/onboardscreen/onboarditem.dart';
import 'package:flutter_food_delivery_v1/screen/welcome/welcome.dart';
import 'package:flutter_food_delivery_v1/service/getstorage.dart';
import 'package:get/get.dart';

class OnboardController extends GetxController with StateMixin {
  RxInt index = 0.obs;
  PageController pageController = PageController();
  RxList<Widget> listOnboard = const <Widget>[
    OnboardItem(
      svgAsset: "assets/images/on_the_way.svg",
      tittle: "FastDelivery",
      subTittle: "Giao hàng nhanh chóng",
    ),
    OnboardItem(
      svgAsset: "assets/images/delivery_address.svg",
      tittle: "Convenience",
      subTittle: "Giao hàng tận tay",
    ),
    OnboardItem(
      svgAsset: "assets/images/app_background.svg",
      tittle: "FoodNinja",
      subTittle: "Nhanh như một nhẫn giả",
    )
  ].obs;
  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.success());
  }

  void onPageChanged(int i) {
    index.value = i;
    change(null, status: RxStatus.success());
  }

  void onNext() {
    index.value++;
    pageController.animateToPage(index.value,
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 500));
    change(null, status: RxStatus.success());
  }

  void onDone() {
    GetStorageService().writeFirstLogin(false);
    Get.offAll(() => const WelComeScreen(),
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        transition: Transition.rightToLeftWithFade);
  }
}
