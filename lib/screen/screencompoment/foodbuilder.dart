import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/model/foodmodel.dart';

class FoodBuilder extends StatelessWidget {
  const FoodBuilder({
    Key? key,
    required this.foodModel,
  }) : super(key: key);

  final FoodModel foodModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(color: primaryColor.withOpacity(0.6)),
            borderRadius: BorderRadius.circular(13)),
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(foodModel.foodImage)),
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              foodModel.foodName,
              softWrap: true,
              style: const TextStyle(
                  fontSize: defautfontsize - 3,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
