import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/compoment/button.dart';
import 'package:flutter_food_delivery_v1/compoment/passwordfield.dart';
import 'package:flutter_food_delivery_v1/compoment/icontextfield.dart';
import 'package:flutter_food_delivery_v1/compoment/textfieldcontainer.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/controller/signupcontroller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:switcher_button/switcher_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Form(
        key: controller.formKey,
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
                    FadeInRightBig(
                      child: SvgPicture.asset(
                        "assets/images/app_background.svg",
                        height: size.height * 0.22,
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
                    FadeInRightBig(
                      child: const Text(
                        "Nhanh nh?? m???t nh???n gi???",
                        style: TextStyle(
                            fontSize: defautfontsize + 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "????ng k?? t??i kho???n",
                      style: TextStyle(
                          fontSize: defautfontsize + 10,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFieldContainer(
                      child: IconTextField(
                          controller: controller.phonenumberController,
                          inputType: TextInputType.number,
                          hintText: "S??? ??i???n tho???i",
                          maxleght: 10,
                          iconData: Icons.phone),
                    ),
                    TextFieldContainer(
                        child: CustomPasswordField(
                      controller: controller.passwordController,
                      hintText: "M???t kh???u...",
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        const Text("????ng k?? t??i x???"),
                        const Spacer(),
                        Obx(
                          () => SwitcherButton(
                            offColor: Colors.green.shade100,
                            onColor: Colors.green.shade800,
                            value: controller.isDriver.value,
                            onChange: (value) => controller.onSwitch(value),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    const Spacer(),
                    CustomButton(
                      text: "????ng k??",
                      onPress: controller.onSignUp,
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
