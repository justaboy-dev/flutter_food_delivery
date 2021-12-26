// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/compoment/customloadingindicator.dart';
import 'package:flutter_food_delivery_v1/screen/restaurantscreen/restaurantscreen.dart';
import 'package:flutter_food_delivery_v1/screen/screencompoment/foodbuilder.dart';
import 'package:flutter_food_delivery_v1/compoment/icontextfield.dart';
import 'package:flutter_food_delivery_v1/screen/screencompoment/restaurantbuilder.dart';
import 'package:flutter_food_delivery_v1/compoment/textfieldcontainer.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/controller/homescreencontroller.dart';
import 'package:flutter_food_delivery_v1/screen/screencompoment/homebannertittle.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeScreenController controller = Get.find();
    Size size = MediaQuery.of(context).size;
    return CustomScrollView(
      controller: controller.scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 20.0),
            child: Row(
              children: [
                const Text(
                  "Hôm nay \nĂn gì ?",
                  style: TextStyle(
                      fontFamily: "Righteous",
                      fontSize: defautfontsize + 30,
                      color: primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                SvgPicture.asset(
                  "assets/images/app_background.svg",
                  width: size.width * 0.35,
                ),
              ],
            ),
          ),
        ),
        SliverAppBar(
          pinned: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: TextFieldContainer(
            radius: 12,
            margin: 0,
            padding: 2,
            child: IconTextField(
                onTap: controller.onSearchBarTap,
                controller: controller.findController,
                hintText: "Tìm kiếm",
                iconData: Icons.search,
                inputType: TextInputType.text),
          ),
        ),
        HomeBannerTittle(
          tittle: "Nhà hàng nổi bật",
          onNext: () => Get.to(
            const RestaurantScreen(),
            transition: Transition.rightToLeft,
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 180,
            child: controller.obx(
              (state) => ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                itemCount: controller.restaurant.value.isEmpty ? 0 : 5,
                itemBuilder: (context, index) {
                  return RestaurantBuilder(
                    restaurantModel: controller.restaurant.value[index],
                  );
                },
              ),
              onLoading: const CustomLoadingIndicator(),
            ),
          ),
        ),
        HomeBannerTittle(
          tittle: "Món ăn nổi bật",
          onNext: () {},
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 220,
            child: controller.obx(
              (state) => ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                itemCount: controller.food.value.isEmpty ? 0 : 10,
                itemBuilder: (context, index) {
                  return FoodBuilder(
                    foodModel: controller.food.value[index],
                  );
                },
                shrinkWrap: true,
              ),
              onLoading: const CustomLoadingIndicator(),
            ),
          ),
        ),
        HomeBannerTittle(tittle: "Món ăn gần bạn", onNext: () {}),
        SliverPadding(
          padding: const EdgeInsets.all(0),
          sliver: Obx(() => SliverGrid(
                delegate: SliverChildBuilderDelegate((builder, index) {
                  return FoodBuilder(
                    foodModel: controller.nearestFood.value[index],
                  );
                }, childCount: controller.nearestFood.value.length),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                ),
              )),
        ),
      ],
    );
  }
}
