// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/compoment/customloadingindicator.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/controller/searchcontroller.dart';
import 'package:flutter_food_delivery_v1/screen/screencompoment/listfooditembuilder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SearchSreen extends StatelessWidget {
  const SearchSreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SearchController controller = Get.put(SearchController());
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 10),
              sliver: SliverAppBar(
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
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 20.0),
                child: Row(
                  children: [
                    const Text(
                      "Tìm món \nĂn ngon !",
                      style: TextStyle(
                          fontFamily: "Righteous",
                          fontSize: defautfontsize + 30,
                          color: primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      "assets/images/web_search.svg",
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
                          return ListFoodItemBuild(
                            food: controller.listsearch[index],
                            index: index,
                          );
                        }, childCount: controller.listsearch.length),
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
                            "Không tìm thấy !",
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
        ),
      ),
    );
  }
}
