// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/controller/homescreencontroller.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePageSreen extends StatelessWidget {
  const HomePageSreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeScreenController controller = Get.put(HomeScreenController());
    return Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Obx(() => Stack(
                children: [
                  PageView(
                    children: [
                      controller.screen[controller.currentIndex.value]
                    ],
                  ),
                  controller.currentIndex.value == 0 &&
                          controller.numberOfItem.value != 0
                      ? Positioned(
                          bottom: 5,
                          right: 10,
                          child: GestureDetector(
                            onTap: () => controller.changeIndex(2),
                            child: Container(
                              height: 60,
                              width: 60,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  border: Border.all(color: primaryColor),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(13)),
                              child: Center(
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Icon(
                                      Icons.shopping_cart_outlined,
                                      size: MediaQuery.of(context).size.width *
                                          0.09,
                                      color: primaryColor,
                                    ),
                                    Positioned(
                                      top: -5,
                                      right: -5,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.red),
                                        child: Center(
                                          child: Text(
                                            controller.numberOfItem.value
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: defautfontsize - 2,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container()
                ],
              )),
        ),
        bottomNavigationBar: Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SalomonBottomBar(
              selectedItemColor: primaryColor,
              currentIndex: controller.currentIndex.value,
              onTap: (index) => controller.changeIndex(index),
              items: [
                /// Home
                SalomonBottomBarItem(
                  icon: const Icon(Icons.home),
                  title: const Text("Trang chủ"),
                ),

                /// Likes
                SalomonBottomBarItem(
                  icon: const Icon(Icons.person),
                  title: const Text("Cá nhân"),
                ),

                /// Search
                SalomonBottomBarItem(
                  icon: const Icon(Icons.shopping_cart),
                  title: const Text("Giỏ hàng"),
                ),

                /// Profile
                SalomonBottomBarItem(
                  icon: const Icon(Icons.settings),
                  title: const Text("Cài đặt"),
                ),
              ],
            ),
          ),
        ));
  }
}
