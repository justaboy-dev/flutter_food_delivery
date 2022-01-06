import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/compoment/button.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/screen/signin/signin.dart';
import 'package:flutter_food_delivery_v1/screen/signup/signup.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WelComeScreen extends StatelessWidget {
  const WelComeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              children: [
                const Spacer(
                  flex: 2,
                ),
                SvgPicture.asset(
                  "assets/images/app_background.svg",
                  width: size.width * 0.8,
                ),
                const Text(
                  "FoodNinja",
                  style: TextStyle(
                    fontFamily: "Righteus",
                    fontSize: defautfontsize + 40,
                    color: primaryColor,
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                CustomButton(
                  text: "Đăng nhập",
                  onPress: () => Get.to(() => const SignInScreen(),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.fastOutSlowIn,
                      transition: Transition.leftToRightWithFade),
                  width: size.width * 0.6,
                ),
                CustomButton(
                  text: "Đăng ký",
                  onPress: () => Get.to(() => const SignUpScreen(),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.fastOutSlowIn,
                      transition: Transition.leftToRightWithFade),
                  width: size.width * 0.6,
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
