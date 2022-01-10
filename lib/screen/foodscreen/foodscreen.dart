// ignore_for_file: invalid_use_of_protected_member

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/controller/homescreencontroller.dart';
import 'package:flutter_food_delivery_v1/screen/screencompoment/foodbuilder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeScreenController controller = Get.find();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 10),
              sliver: SliverAppBar(
                elevation: 0,
                floating: true,
                backgroundColor: Colors.white,
                pinned: true,
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
                actions: [
                  SvgPicture.asset(
                    "assets/images/fast-food.svg",
                    width: size.width * 0.2,
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: Text(
                "Món ăn nổi bật",
                style: TextStyle(
                  fontSize: defautfontsize + 30,
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Righteous",
                ),
                softWrap: true,
                textAlign: TextAlign.left,
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
                      return FlipInY(
                        duration: const Duration(milliseconds: 1500),
                        child: FoodBuilder(
                          food: controller.food.value[index],
                        ),
                      );
                    }, childCount: controller.food.value.length),
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
