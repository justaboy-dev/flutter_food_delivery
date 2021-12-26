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
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: AspectRatio(
        aspectRatio: 0.7,
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
              const Spacer(),
              Text(
                foodModel.foodName,
                softWrap: true,
                style: const TextStyle(
                    fontSize: defautfontsize - 3,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: size.width * 0.035,
                    ),
                    Text(
                      foodModel.foodSpace.toString() + " km",
                      style: const TextStyle(fontSize: defautfontsize - 4),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.timer_sharp,
                      size: size.width * 0.035,
                    ),
                    Text(
                      foodModel.foodMinute.toString() + " min",
                      style: const TextStyle(fontSize: defautfontsize - 4),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
