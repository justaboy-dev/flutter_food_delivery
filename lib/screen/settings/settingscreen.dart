import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/compoment/button.dart';
import 'package:flutter_food_delivery_v1/screen/welcome/welcome.dart';
import 'package:flutter_food_delivery_v1/service/getstorage.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              children: [
                CustomButton(
                    text: "Logout",
                    onPress: () {
                      GetStorageService().writeIsLogin(false);
                      Get.offAll(() => const WelComeScreen());
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
