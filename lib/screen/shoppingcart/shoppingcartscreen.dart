// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/compoment/button.dart';
import 'package:flutter_food_delivery_v1/compoment/customloadingindicator.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/controller/shopingcartcontroller.dart';
import 'package:flutter_food_delivery_v1/screen/screencompoment/shoppingcartitem.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ShoppingCartController());
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    const Text(
                      "Giỏ hàng",
                      style: TextStyle(
                          fontSize: defautfontsize + 30,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Righteous"),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      "assets/images/shopping-bag.svg",
                      width: size.width * 0.2,
                    )
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              SliverFillRemaining(
                fillOverscroll: true,
                child: controller.obx(
                    (state) => ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.listFood.value.length,
                          itemBuilder: (context, index) {
                            return ShoppingCartItem(
                                food: controller.listFood.value[index]);
                          },
                        ),
                    onLoading: const CustomLoadingIndicator(),
                    onEmpty: const Center(
                      child: Text(
                        "Bạn chưa có món nào !",
                        style: TextStyle(fontSize: defautfontsize + 5),
                        softWrap: true,
                      ),
                    )),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 120,
                ),
              )
            ],
          ),
          controller.obx(
              (state) => Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: primaryColor),
                          color: Colors.white),
                      height: 140,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Tổng cộng:",
                                style: TextStyle(
                                    fontSize: defautfontsize + 5,
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              Text(
                                controller.total.value.toString() + " VNĐ",
                                style: const TextStyle(
                                    fontSize: defautfontsize + 5,
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const Spacer(),
                          CustomButton(
                            text: "Đặt hàng ngay",
                            onPress: () {},
                            width: 400,
                            vertical: 5,
                            horizontal: 5,
                          )
                        ],
                      ),
                    ),
                  ),
              onEmpty: Container()),
        ],
      ),
    );
  }
}
