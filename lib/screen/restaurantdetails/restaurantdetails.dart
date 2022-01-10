// ignore_for_file: invalid_use_of_protected_member

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/compoment/customloadingindicator.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/controller/restaurantdetailscontroller.dart';
import 'package:flutter_food_delivery_v1/screen/screencompoment/listfooditembuilder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:we_slide/we_slide.dart';

class RestaurantDetails extends StatelessWidget {
  const RestaurantDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    RestaurantDetailsController controller =
        Get.put(RestaurantDetailsController());

    return Scaffold(
      body: controller.obx(
        (state) => Padding(
          padding: const EdgeInsets.all(15),
          child: WeSlide(
            backgroundColor: Colors.white,
            isDismissible: true,
            panelMaxSize: size.height * 0.85,
            panelMinSize: size.height * 0.2,
            hideAppBar: false,
            transformScale: true,
            transformScaleEnd: 0.8,
            parallax: true,
            parallaxOffset: 0.4,
            appBar: Row(
              children: [
                Container(
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
                const Spacer(),
              ],
            ),
            body: ZoomIn(
              duration: const Duration(milliseconds: 1200),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage(
                        controller.restaurant.value.restaurantImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            panel: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  FadeInLeft(
                    child: Container(
                      height: 190,
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.restaurant.value.restaurantName,
                            style: const TextStyle(
                              fontSize: defautfontsize + 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            softWrap: true,
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(controller.restaurant.value.restaurantSpace
                                      .toString() +
                                  " km"),
                              const Spacer(
                                flex: 1,
                              ),
                              const Icon(Icons.access_time),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(controller
                                  .restaurant.value.restaurantOpenTime
                                  .format(context)
                                  .toString()),
                              const Spacer(
                                flex: 4,
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Text(
                            "Danh sách món ăn",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: defautfontsize + 5),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.75 - 190,
                    child: CustomScrollView(
                      physics: const ClampingScrollPhysics(),
                      slivers: [
                        SliverPadding(
                          padding: const EdgeInsets.all(0),
                          sliver: controller.obx(
                              (state) => SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                        (context, index) {
                                      return ListFoodItemBuild(
                                        food: controller.listFood.value[index],
                                        index: index,
                                      );
                                    },
                                        childCount:
                                            controller.listFood.value.length),
                                  ),
                              onLoading: SliverToBoxAdapter(
                                  child: Container(
                                      height: size.height,
                                      padding:
                                          const EdgeInsets.only(bottom: 50),
                                      child: const CustomLoadingIndicator())),
                              onEmpty: SliverToBoxAdapter(
                                child: SizedBox(
                                  height: size.height,
                                  child: Column(
                                    children: [
                                      const Spacer(
                                        flex: 1,
                                      ),
                                      const Text(
                                        "Không tìm thấy !",
                                        style: TextStyle(
                                            fontFamily: "Righteous",
                                            fontSize: defautfontsize + 30,
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Center(
                                        child: SvgPicture.asset(
                                          "assets/images/not_found.svg",
                                          width: size.width * 0.35,
                                        ),
                                      ),
                                      const Spacer(
                                        flex: 2,
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        onLoading: Container(
          height: size.height,
          padding: const EdgeInsets.only(bottom: 50),
          child: const CustomLoadingIndicator(),
        ),
      ),
    );
  }
}
