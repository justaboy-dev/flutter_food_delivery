// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/controller/homescreencontroller.dart';
import 'package:flutter_food_delivery_v1/screen/screencompoment/restaurantbuilder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeScreenController controller = Get.find();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                children: [
                  const Text(
                    "Nhà hàng \nNổi bật",
                    style: TextStyle(
                      fontSize: defautfontsize + 30,
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Righteous",
                    ),
                    softWrap: true,
                    textAlign: TextAlign.left,
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    "assets/images/restaurant.svg",
                    width: size.width * 0.2,
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(0),
              sliver: Obx(() => SliverGrid(
                    delegate: SliverChildBuilderDelegate((builder, index) {
                      return RestaurantBuilder(
                        width: 200,
                        restaurantModel: controller.restaurant.value[index],
                      );
                    }, childCount: controller.restaurant.value.length),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.85,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
