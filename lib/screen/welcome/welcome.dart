import 'package:animate_do/animate_do.dart';
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
                FadeInRightBig(
                  child: SvgPicture.asset(
                    "assets/images/app_background.svg",
                    width: size.width * 0.8,
                  ),
                ),
                FadeInRightBig(
                  child: const Text(
                    "FoodNinja",
                    style: TextStyle(
                      fontFamily: "Righteus",
                      fontSize: defautfontsize + 40,
                      color: primaryColor,
                    ),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                FadeInUpBig(
                  child: CustomButton(
                    text: "Đăng nhập",
                    onPress: () => Get.to(() => const SignInScreen(),
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.fastOutSlowIn,
                        transition: Transition.leftToRightWithFade),
                    width: size.width * 0.6,
                  ),
                ),
                FadeInUpBig(
                  delay: const Duration(milliseconds: 400),
                  child: CustomButton(
                    text: "Đăng ký",
                    onPress: () => Get.to(() => const SignUpScreen(),
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.fastOutSlowIn,
                        transition: Transition.leftToRightWithFade),
                    width: size.width * 0.6,
                  ),
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
