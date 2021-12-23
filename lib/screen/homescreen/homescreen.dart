// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/compoment/customloadingindicator.dart';
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
          // actions: [
          //   Container(
          //     width: 55,
          //     height: 20,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         color: primaryColor.withOpacity(0.2)),
          //     child: IconButton(
          //         onPressed: controller.onOpenMenuBar,
          //         icon: Icon(
          //           Icons.menu,
          //           size: size.width * 0.1,
          //           color: primaryColor,
          //         )),
          //   )
          // ],
        ),
        HomeBannerTittle(
          tittle: "Nhà hàng nổi bật",
          onNext: () {},
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 180,
            child: controller.obx(
              (state) => ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                itemCount: 5,
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
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 180,
            child: controller.obx(
              (state) => ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return FoodBuilder(
                    foodModel: controller.food.value[index],
                  );
                },
              ),
              onLoading: const CustomLoadingIndicator(),
            ),
          ),
        ),
        HomeBannerTittle(tittle: "Món ăn gần bạn", onNext: () {}),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate((builder, index) {
              return controller.obx(
                (state) => FoodBuilder(
                  foodModel: controller.nearestFood.value[index],
                ),
                onLoading: const CustomLoadingIndicator(),
              );
            }, childCount: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
          ),
        ),
      ],
    );
  }
}
