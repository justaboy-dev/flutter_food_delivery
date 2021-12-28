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
      onTap: () => Get.to(
        () => RestaurantDetails(restaurant: restaurantModel),
        duration: const Duration(milliseconds: 400),
        transition: Transition.rightToLeftWithFade,
        curve: Curves.fastOutSlowIn,
      ),
      child: Stack(
        children: [
          Container(
            width: width,
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(color: primaryColor.withOpacity(0.8)),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(restaurantModel.restaurantImage)),
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          Positioned(
            top: 15,
            right: 20,
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
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 5,
            right: 5,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(18),
                        bottomRight: Radius.circular(18)),
                    color: primaryColor.withOpacity(0.2)),
                height: 30,
                child: Text(
                  restaurantModel.restaurantName,
                  softWrap: true,
                  style: const TextStyle(
                      fontSize: defautfontsize - 3,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
          ),
        ],
      ),
    );
  }
}
