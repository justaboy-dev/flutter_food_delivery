import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/compoment/button.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/controller/uploadavatarcontroller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UploadAvatar extends StatelessWidget {
  const UploadAvatar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final UpLoadAvatarController controller = Get.put(UpLoadAvatarController());

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 0,
                floating: true,
                backgroundColor: Colors.white,
                pinned: true,
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: primaryColor.withOpacity(0.2),
                  ),
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
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Cập nhật hình ảnh \nđại điện",
                        style: TextStyle(
                            fontSize: defautfontsize + 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Thông tin này sẽ được hiển thị \ntrong hồ sơ của bạn",
                        style: TextStyle(
                          fontSize: defautfontsize,
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: controller.onChooseImage,
                      child: FlipInY(
                        duration: const Duration(milliseconds: 1300),
                        child: Container(
                          width: size.width * 0.8,
                          height: size.height * 0.45,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: primaryColor.withOpacity(0.8), width: 3),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: controller.obx(
                            (state) => Image.file(
                              File(controller.filePath.value),
                              fit: BoxFit.cover,
                            ),
                            onEmpty: Padding(
                              padding: const EdgeInsets.all(60.0),
                              child: SvgPicture.asset(
                                "assets/icons/gallery.svg",
                                width: size.width * 0.3,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: CustomButton(
                          text: "Kế tiếp", onPress: controller.onNext),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
