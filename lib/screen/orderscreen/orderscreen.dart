// ignore_for_file: invalid_use_of_protected_member

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/compoment/button.dart';
import 'package:flutter_food_delivery_v1/compoment/customloadingindicator.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/controller/ordersreen.dart';
import 'package:flutter_food_delivery_v1/screen/mapscreen/mapscreen.dart';
import 'package:flutter_food_delivery_v1/screen/screencompoment/buildbanneruser.dart';
import 'package:get/get.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    OrderScreenController controller = Get.put(OrderScreenController());
    return Container(
      padding: const EdgeInsets.all(15),
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: primaryColor.withOpacity(0.2)),
            child: IconButton(
              icon: Icon(
                Icons.chevron_left,
                size: size.width * 0.07,
                color: primaryColor,
              ),
              onPressed: () => Get.back(),
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(15),
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ZoomIn(
                duration: const Duration(milliseconds: 1200),
                child: Center(
                  child: Image.asset(
                    "assets/images/drive.gif",
                    width: size.width * 0.48,
                  ),
                ),
              ),
              controller.obx(
                  (state) => Center(
                        child: LinearProgressBar(
                          maxSteps: controller.statusmap.length - 1,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: controller.billStatus.value,
                          progressColor: Colors.red,
                          backgroundColor: Colors.grey,
                          minHeight: 8,
                        ),
                      ),
                  onLoading: Container()),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    const Text(
                      "Trạng thái đơn hàng: ",
                      style: TextStyle(fontSize: defautfontsize + 3),
                    ),
                    controller.obx(
                        (state) => FadeInRight(
                              duration: const Duration(milliseconds: 1200),
                              child: Text(
                                controller.statusmap.entries
                                    .firstWhere((element) =>
                                        element.value ==
                                        controller.billStatus.value)
                                    .key
                                    .toString(),
                                style: TextStyle(
                                    fontSize: defautfontsize + 3,
                                    fontWeight: FontWeight.bold,
                                    color: controller.billStatus.value == 5
                                        ? Colors.red
                                        : Colors.green),
                              ),
                            ),
                        onLoading: Container()),
                  ],
                ),
              ),
              FadeInRight(
                duration: const Duration(milliseconds: 1200),
                child: controller.obx(
                    (state) => BuildBannerUser(
                          name: controller.user.value.firstname.toString() +
                              " " +
                              controller.user.value.lastname.toString(),
                          address: controller.user.value.address!.fullAddress
                              .toString(),
                          image: "",
                          imageBase64:
                              controller.user.value.avatarUrl.toString(),
                        ),
                    onLoading: Container()),
              ),
              FadeInRight(
                duration: const Duration(milliseconds: 1200),
                child: controller.obx(
                    (state) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: BuildBannerUser(
                            name: controller.driver.value.firstname.toString() +
                                " " +
                                controller.driver.value.lastname.toString(),
                            address:
                                controller.driver.value.phoneNumber.toString(),
                            image: "",
                            imageBase64:
                                controller.driver.value.avatarUrl.toString(),
                          ),
                        ),
                    onLoading: const CustomLoadingIndicator()),
              ),
              const Spacer(),
              controller.obx(
                  (state) => controller.billStatus.value == 1 ||
                          controller.billStatus.value == 2 ||
                          controller.billStatus.value == 3
                      ? ZoomIn(
                          child: Row(
                            children: [
                              ZoomIn(
                                duration: const Duration(milliseconds: 1200),
                                child: GestureDetector(
                                  onTap: () => Get.to(() => const MapScreen(),
                                      curve: Curves.fastOutSlowIn,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      transition:
                                          Transition.rightToLeftWithFade,
                                      arguments: controller.fetchbill.value),
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    decoration: BoxDecoration(
                                        color: primaryColor.withOpacity(0.3),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Icon(
                                      Icons.location_on,
                                      size: size.width * 0.08,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () => launch(Uri(
                                        scheme: "tel",
                                        path: controller
                                            .driver.value.phoneNumber
                                            .toString())
                                    .toString()),
                                child: Container(
                                  height: 50,
                                  width: 100,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      color: primaryColor.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Icon(
                                    Icons.phone,
                                    size: size.width * 0.08,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : controller.billStatus.value == 4
                          ? Center(
                              child: CustomButton(
                                text: "HOÀN THÀNH",
                                onPress: () => controller.complete(),
                                width: size.width * 0.7,
                              ),
                            )
                          : Container(),
                  onLoading: Container()),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
