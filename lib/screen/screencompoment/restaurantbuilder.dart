import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/model/restaurantmodel.dart';
import 'package:flutter_food_delivery_v1/screen/restaurantdetails/restaurantdetails.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RestaurantBuilder extends StatelessWidget {
  const RestaurantBuilder({
    Key? key,
    required this.restaurantModel,
    this.width = 120,
  }) : super(key: key);

  final RestaurantModel restaurantModel;
  final double width;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Get.to(() => const RestaurantDetails(),
          duration: const Duration(milliseconds: 400),
          transition: Transition.rightToLeftWithFade,
          curve: Curves.fastOutSlowIn,
          arguments: restaurantModel),
      child: Column(
        children: [
          Container(
            width: width,
            height: 150,
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(color: primaryColor.withOpacity(0.8)),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(restaurantModel.restaurantImage)),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              width: width,
              height: 40,
              child: Text(
                restaurantModel.restaurantName,
                softWrap: true,
                style: const TextStyle(
                    fontSize: defautfontsize - 3,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            width: width,
            child: Row(
              children: [
                Text(restaurantModel.restaurantRate.toString()),
                const SizedBox(
                  width: 7,
                ),
                restaurantModel.restaurantRate < 2
                    ? SvgPicture.asset(
                        "assets/icons/no_star.svg",
                        width: size.width * 0.04,
                      )
                    : SvgPicture.asset("assets/icons/star.svg",
                        width: size.width * 0.04),
                const Spacer()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
