import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/compoment/button.dart';
import 'package:flutter_food_delivery_v1/compoment/customloadingindicator.dart';
import 'package:flutter_food_delivery_v1/compoment/passwordfield.dart';
import 'package:flutter_food_delivery_v1/compoment/icontextfield.dart';
import 'package:flutter_food_delivery_v1/compoment/textfieldcontainer.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/controller/signincontroller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController controller = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Form(
        key: controller.formState,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
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
                      height: 60,
                    ),
                    const Text(
                      "????ng nh???p v??o t??i kho???n",
                      style: TextStyle(
                          fontSize: defautfontsize + 10,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFieldContainer(
                      child: IconTextField(
                        inputType: TextInputType.number,
                        maxleght: 10,
                        controller: controller.phoneNumberController,
                        hintText: "S??? ??i???n tho???i",
                        iconData: Icons.phone,
                      ),
                    ),
                    TextFieldContainer(
                        child: CustomPasswordField(
                      controller: controller.passwordController,
                      hintText: "M???t kh???u...",
                    )),
                    const Spacer(),
                    GestureDetector(
                      onTap: controller.onForgotPass,
                      child: const Text("Qu??n m???t kh???u ?"),
                    ),
                    const Spacer(),
                    controller.obx(
                        (state) => CustomButton(
                              text: "????ng nh???p",
                              onPress: controller.onLogin,
                            ),
                        onLoading: const SizedBox(
                          child: CustomLoadingIndicator(),
                        )),
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
