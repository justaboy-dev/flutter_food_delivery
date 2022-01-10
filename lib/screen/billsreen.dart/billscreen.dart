// ignore_for_file: invalid_use_of_protected_member
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/compoment/customloadingindicator.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/controller/billcontroller.dart';
import 'package:flutter_food_delivery_v1/screen/screencompoment/buildbillitem.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BillScreen extends StatelessWidget {
  const BillScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BillController controller = Get.put(BillController());
    Size size = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 20.0),
            child: Row(
              children: [
                const Text(
                  "Đơn hàng \nĐã đặt",
                  style: TextStyle(
                      fontFamily: "Righteous",
                      fontSize: defautfontsize + 30,
                      color: primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                SvgPicture.asset(
                  "assets/images/app_background.svg",
                  width: size.width * 0.35,
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(0),
          sliver: controller.obx(
              (state) => SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return BuildBillItem(
                        bill: controller.listbillview.value[index],
                        index: index,
                      );
                    }, childCount: controller.listbillview.length),
                  ),
              onLoading: SliverToBoxAdapter(
                  child: Container(
                      height: size.height,
                      padding: const EdgeInsets.only(bottom: 50),
                      child: const CustomLoadingIndicator())),
              onEmpty: SliverToBoxAdapter(
                child: SizedBox(
                  height: size.height,
                  child: Column(
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      const Text(
                        "Chưa có đơn nào !",
                        style: TextStyle(
                            fontFamily: "Righteous",
                            fontSize: defautfontsize + 30,
                            color: primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Center(
                        child: SvgPicture.asset(
                          "assets/images/not_found.svg",
                          width: size.width * 0.35,
                        ),
                      ),
                      const Spacer(
                        flex: 2,
                      )
                    ],
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
