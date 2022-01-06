import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/model/restaurantmodel.dart';
import 'package:flutter_food_delivery_v1/screen/screencompoment/foodbuilder.dart';
import 'package:get/get.dart';
import 'package:we_slide/we_slide.dart';

class RestaurantDetails extends StatelessWidget {
  const RestaurantDetails({Key? key, required this.restaurant})
      : super(key: key);

  final RestaurantModel restaurant;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: WeSlide(
          backgroundColor: Colors.white,
          isDismissible: true,
          panelMaxSize: size.height * 0.85,
          panelMinSize: size.height * 0.2,
          hideAppBar: false,
          transformScale: true,
          transformScaleEnd: 0.8,
          parallax: true,
          parallaxOffset: 0.4,
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
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(restaurant.restaurantImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          panel: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  height: 190,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.restaurantName,
                        style: const TextStyle(
                          fontSize: defautfontsize + 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        softWrap: true,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(restaurant.restaurantSpace.toString() + " km"),
                          const Spacer(
                            flex: 1,
                          ),
                          const Icon(Icons.access_time),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(restaurant.restaurantOpenTime
                              .format(context)
                              .toString()),
                          const Spacer(
                            flex: 4,
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Text(
                        "Danh sách món ăn",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: defautfontsize + 5),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.75 - 190,
                  child: CustomScrollView(
                    physics: const ClampingScrollPhysics(),
                    slivers: [
                      SliverGrid(
                        delegate: SliverChildBuilderDelegate((builder, index) {
                          return FoodBuilder(
                            food: restaurant.restaurantFood[index],
                          );
                        }, childCount: restaurant.restaurantFood.length),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.85,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
