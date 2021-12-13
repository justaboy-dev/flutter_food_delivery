import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/compoment/passwordfield.dart';
import 'package:flutter_food_delivery_v1/compoment/textfield.dart';
import 'package:flutter_food_delivery_v1/compoment/textfieldcontainer.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  static final formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Form(
        key: formState,
        child: SingleChildScrollView(
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
                    fontSize: defautfontsize + 10, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                "Đăng nhập vào tài khoản",
                style: TextStyle(
                    fontSize: defautfontsize + 10, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              const TextFieldContainer(
                child: CustomTextField(
                  hintText: "Tài khoản..",
                  iconData: Icons.person,
                  isEmail: true,
                ),
              ),
              const TextFieldContainer(
                  child: CustomPasswordField(
                hintText: "Mật khẩu...",
              )),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: const Text("Quên mật khẩu ?"),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), gradient: linnear),
                child: TextButton(
                  child: Text(
                    "Đăng nhập".toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: defautfontsize + 3,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
