import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/controller/shopingcartcontroller.dart';
import 'package:flutter_food_delivery_v1/model/foodmodel.dart';
import 'package:get/get.dart';

class ShoppingCartItem extends StatelessWidget {
  const ShoppingCartItem({
    Key? key,
    required this.food,
  }) : super(key: key);

  final FoodModel food;

  @override
  Widget build(BuildContext context) {
    final ShoppingCartController controller = Get.find();
    final Size size = MediaQuery.of(context).size;
    return controller.obx(
      (state) => Dismissible(
        key: UniqueKey(),
        onDismissed: (_) => controller.onDissmissed(food),
        direction: DismissDirection.horizontal,
        background: Container(
          height: 100,
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.delete_forever,
              size: size.width * 0.1,
              color: Colors.white,
            ),
          ),
        ),
        child: Container(
          height: 100,
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 5,
                  spreadRadius: 0,
                  blurStyle: BlurStyle.outer)
            ],
          ),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 80,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: NetworkImage(food.foodImage), fit: BoxFit.cover),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food.foodName,
                        style: const TextStyle(
                          fontSize: defautfontsize + 1,
                        ),
                        softWrap: true,
                      ),
                      const Spacer(),
                      Text(
                        (food.foodPrice * food.foodAmount).toString() + " VNĐ",
                        style: const TextStyle(
                          fontSize: defautfontsize + 2,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 75,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => controller.onMinus(food),
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  blurRadius: 5,
                                  spreadRadius: 0,
                                  blurStyle: BlurStyle.outer)
                            ]),
                        child: Icon(
                          Icons.remove,
                          color: primaryColor,
                          size: size.width * 0.04,
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 25,
                      height: 25,
                      child: Center(
                        child: Text(
                          food.foodAmount.toString(),
                          style: const TextStyle(
                              fontSize: defautfontsize + 4,
                              fontWeight: FontWeight.bold,
                              color: primaryColor),
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => controller.onPlus(food),
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: primaryColor.withOpacity(0.8),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  blurRadius: 5,
                                  spreadRadius: 0,
                                  blurStyle: BlurStyle.outer)
                            ]),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: size.width * 0.04,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
