// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/controller/homescreencontroller.dart';
import 'package:flutter_food_delivery_v1/screen/homescreen/homescreen.dart';
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
          child: const HomePage(),
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
