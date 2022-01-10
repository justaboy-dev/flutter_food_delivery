import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/compoment/button.dart';
import 'package:flutter_food_delivery_v1/compoment/customloadingindicator.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/controller/settingcontroller.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingController controller = Get.put(SettingController());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () => controller.onChangeAvatar(),
                  child: ZoomIn(
                    duration: const Duration(milliseconds: 1200),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(180),
                      child: SizedBox(
                        height: 200,
                        width: 200,
                        child: controller.obx(
                            (state) => Image.memory(
                                  base64Decode(
                                    controller.user.value.avatarUrl.toString(),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                            onLoading: const CustomLoadingIndicator()),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                controller.obx((state) => FadeInRight(
                      duration: const Duration(milliseconds: 1200),
                      child: Text(
                        controller.user.value.firstname.toString() +
                            " " +
                            controller.user.value.lastname.toString(),
                        style: const TextStyle(
                            fontSize: defautfontsize + 10,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                const Spacer(),
                FadeInRight(
                  duration: const Duration(milliseconds: 1200),
                  delay: const Duration(milliseconds: 300),
                  child: GestureDetector(
                    onTap: () => controller.onChangedAddress(),
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: const ListTile(
                        title: Text("Thay đổi địa chỉ"),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                    ),
                  ),
                ),
                FadeInRight(
                  duration: const Duration(milliseconds: 1200),
                  delay: const Duration(milliseconds: 600),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: const ListTile(
                        title: Text("Thay đổi hồ sơ"),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                FadeInRight(
                  duration: const Duration(milliseconds: 1200),
                  delay: const Duration(milliseconds: 900),
                  child: CustomButton(
                    text: "Logout",
                    onPress: () => controller.onLogout(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
