import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/compoment/button.dart';
import 'package:flutter_food_delivery_v1/compoment/passwordfield.dart';
import 'package:flutter_food_delivery_v1/compoment/icontextfield.dart';
import 'package:flutter_food_delivery_v1/compoment/textfieldcontainer.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Form(
        key: formKey,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SvgPicture.asset(
                      "assets/images/app_background.svg",
                      height: size.height * 0.22,
                    ),
                    const Text(
                      "FoodNinja",
                      style: TextStyle(
                        fontFamily: "Righteus",
                        fontSize: defautfontsize + 40,
                        color: primaryColor,
                      ),
                    ),
                    const Text(
                      "Nhanh như một nhẫn giả",
                      style: TextStyle(
                          fontSize: defautfontsize + 10,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Đăng kí tài khoản",
                      style: TextStyle(
                          fontSize: defautfontsize + 10,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const TextFieldContainer(
                      child: IconTextField(
                          hintText: "Tên người dùng", iconData: Icons.person),
                    ),
                    const TextFieldContainer(
                      child: IconTextField(
                          hintText: "Email", iconData: Icons.email),
                    ),
                    const TextFieldContainer(
                        child: CustomPasswordField(
                      hintText: "Mật khẩu...",
                    )),
                    const Spacer(),
                    CustomButton(
                      text: "Đăng ký",
                      onPress: () {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
