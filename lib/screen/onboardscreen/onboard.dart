// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/compoment/button.dart';
import 'package:flutter_food_delivery_v1/controller/onboardcontroller.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnboardController controller = Get.put(OnboardController());
    return Scaffold(
      body: controller.obx(
        (state) => Stack(
          children: [
            PageView(
                controller: controller.pageController,
                onPageChanged: (value) => controller.onPageChanged(value),
                children: controller.listOnboard.value),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: controller.index.value,
                  count: controller.listOnboard.length,
                  effect: const WormEffect(),
                ),
              ),
            ),
            controller.index.value != controller.listOnboard.length - 1
                ? Positioned(
                    bottom: 25,
                    left: 20,
                    child: CustomButton(
                      text: "Skip",
                      onPress: () => controller.onDone(),
                      width: 80,
                      heigh: 40,
                    ),
                  )
                : Container(),
            Positioned(
              bottom: 25,
              right: 20,
              child: CustomButton(
                text:
                    controller.index.value != controller.listOnboard.length - 1
                        ? "Next"
                        : "Done",
                onPress: () =>
                    controller.index.value != controller.listOnboard.length - 1
                        ? controller.onNext()
                        : controller.onDone(),
                width: 80,
                heigh: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
