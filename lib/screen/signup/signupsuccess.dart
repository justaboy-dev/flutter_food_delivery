import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/compoment/button.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_svg/svg.dart';

class SignUpSuccess extends StatelessWidget {
  const SignUpSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              children: [
                const Spacer(),
                SvgPicture.asset(
                  "assets/icons/check.svg",
                  width: size.width * 0.6,
                  color: primaryColor,
                ),
                const Spacer(),
                const Text(
                  "Chúc mừng !",
                  style: TextStyle(
                      color: primaryColor,
                      fontFamily: "Righteous",
                      fontSize: defautfontsize + 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Bạn đã sẵn sàng để đặt món ",
                  style: TextStyle(
                      fontFamily: "Righteous",
                      fontSize: defautfontsize + 5,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                CustomButton(text: "Đặt món ngay", onPress: () {}),
                const Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
