import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/compoment/button.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/controller/homescreencontroller.dart';
import 'package:flutter_food_delivery_v1/model/foodmodel.dart';
import 'package:get/get.dart';
import 'package:we_slide/we_slide.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({Key? key, required this.food}) : super(key: key);

  final FoodModel food;
  @override
  Widget build(BuildContext context) {
    final HomeScreenController controller = Get.find();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: WeSlide(
          backgroundColor: Colors.transparent,
          isDismissible: true,
          panelMaxSize: size.height * 0.9,
          panelMinSize: size.height * 0.3,
          hideAppBar: false,
          transformScale: true,
          footer: CustomButton(
            text: "Add",
            onPress: () {},
            horizontal: 30,
          ),
          footerHeight: 70,
          hideFooter: false,
          appBar: Row(
            children: [
              Container(
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
              const Spacer(),
            ],
          ),
          body: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              image: DecorationImage(
                  image: NetworkImage(food.foodImage), fit: BoxFit.contain),
            ),
          ),
          panel: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food.foodName,
                        style: const TextStyle(
                          fontSize: defautfontsize + 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        softWrap: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(food.foodSpace.toString() + " km"),
                          const Spacer(
                            flex: 1,
                          ),
                          const Icon(Icons.timer),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(food.foodMinute.toString() + " min"),
                          const Spacer(
                            flex: 4,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        food.foodDescription.toString(),
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: defautfontsize + 3,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
