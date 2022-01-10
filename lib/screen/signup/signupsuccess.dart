import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/compoment/button.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/controller/signupcontroller.dart';
import 'package:flutter_food_delivery_v1/screen/mainscreen/mainscreen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SignUpSuccess extends StatelessWidget {
  const SignUpSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SignUpController controller = Get.find<SignUpController>();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              children: [
                const Spacer(),
                FlipInY(
                  duration: const Duration(milliseconds: 1300),
                  child: SvgPicture.asset(
                    "assets/icons/check.svg",
                    width: size.width * 0.6,
                    color: primaryColor,
                  ),
                ),
                const Spacer(),
                ZoomIn(
                  duration: const Duration(milliseconds: 1000),
                  child: const Text(
                    "Chúc mừng !",
                    style: TextStyle(
                        color: primaryColor,
                        fontFamily: "Righteous",
                        fontSize: defautfontsize + 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  controller.isDriver.value
                      ? "Bạn đã sẵn sàng để giao hàng "
                      : "Bạn đã sẵn sàng để đặt món ",
                  style: const TextStyle(
                      fontFamily: "Righteous",
                      fontSize: defautfontsize + 5,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                CustomButton(
                    text: "Đặt món ngay",
                    onPress: () => Get.offAll(
                          () => const HomePageSreen(),
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.fastOutSlowIn,
                          transition: Transition.rightToLeftWithFade,
                        )),
                const Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
