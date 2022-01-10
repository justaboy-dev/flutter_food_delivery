import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/model/foodmodel.dart';
import 'package:flutter_food_delivery_v1/screen/fooddetails/fooddetails.dart';
import 'package:flutter_food_delivery_v1/service/appservice.dart';
import 'package:get/get.dart';

class ListFoodItemBuild extends StatelessWidget {
  const ListFoodItemBuild({
    Key? key,
    required this.food,
    required this.index,
  }) : super(key: key);

  final FoodModel food;
  final int index;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Get.to(
        () => FoodDetails(food: food),
        transition: Transition.rightToLeftWithFade,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      ),
      child: FadeInRightBig(
        delay: Duration(milliseconds: 150 * index),
        child: SizedBox(
          height: 120,
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(food.foodImage),
                  ),
                ),
              ),
              Container(
                height: 100,
                width: size.width * 0.58,
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food.foodName,
                      style: const TextStyle(fontSize: defautfontsize + 1),
                      softWrap: true,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: size.width * 0.05,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(food.foodSpace.toString() + " km"),
                        const Spacer(),
                        Text(
                          AppService().toMoney(food.foodPrice) + " VNĐ",
                          style: const TextStyle(
                              fontSize: defautfontsize + 3,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Icon(
                          Icons.timer_rounded,
                          size: size.width * 0.05,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(food.foodMinute.toString() + " min")
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
