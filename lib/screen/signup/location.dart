import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/compoment/button.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/controller/locationpickcontroller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LocationPick extends StatelessWidget {
  const LocationPick({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final LocationPickController controller = Get.put(LocationPickController());

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
                        "Chọn vị trí \ngiao hàng",
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
                    const Spacer(
                      flex: 1,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/location.svg",
                          width: size.width * 0.08,
                        ),
                        Container(
                          width: size.width * 0.78,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: controller.obx(
                            (state) => Text(
                              controller.address.value,
                              style: const TextStyle(
                                  fontSize: defautfontsize + 5,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                              softWrap: true,
                            ),
                            onEmpty: const Text(
                              "Vị trí của bạn",
                              style: TextStyle(
                                  fontSize: defautfontsize + 5,
                                  fontWeight: FontWeight.bold),
                              softWrap: true,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      text: "Chọn vị trí",
                      onPress: controller.onChooseLocation,
                      width: size.width * 0.8,
                      gradient: const LinearGradient(
                          colors: [Colors.black26, Colors.black38]),
                    ),
                    const Spacer(
                      flex: 3,
                    ),
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
