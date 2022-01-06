import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/compoment/button.dart';
import 'package:flutter_food_delivery_v1/compoment/normaltextfield.dart';
import 'package:flutter_food_delivery_v1/compoment/textfieldcontainer.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/controller/fillbiocontroller.dart';
import 'package:get/get.dart';

class FillBioScreen extends StatefulWidget {
  const FillBioScreen({Key? key}) : super(key: key);
  @override
  State<FillBioScreen> createState() => _FillBioScreenState();
}

class _FillBioScreenState extends State<FillBioScreen> {
  final FillBioController controller = Get.put(FillBioController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.formKey,
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
                          "Điền thông tin để \ntiếp tục",
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
                      const SizedBox(
                        height: 40,
                      ),
                      TextFieldContainer(
                        radius: 13,
                        child: NormalTextField(
                          controller: controller.firstname,
                          hintText: "Họ",
                        ),
                      ),
                      TextFieldContainer(
                        radius: 13,
                        child: NormalTextField(
                          controller: controller.lastname,
                          hintText: "Tên",
                        ),
                      ),
                      const Spacer(),
                      Center(
                        child: CustomButton(
                            text: "Kế tiếp",
                            onPress: () => controller.onNext()),
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
      ),
    );
  }
}
