import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/compoment/button.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/controller/restaurantratecontroller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RestaurantRate extends StatefulWidget {
  const RestaurantRate({Key? key}) : super(key: key);
  @override
  _RestaurantRateState createState() => _RestaurantRateState();
}

class _RestaurantRateState extends State<RestaurantRate> {
  double rate = 3;
  @override
  Widget build(BuildContext context) {
    final RestaurantRateController controller =
        Get.put(RestaurantRateController());

    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                CircularProfileAvatar(
                  "",
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://cuongquat.com/files/tin/34/jpg/cong-thuc-pha-cocktail-mojito.jpg"))),
                  ),
                  radius: 100,
                  backgroundColor: Colors.transparent,
                  borderWidth: 3,
                  elevation: 5.0,
                  foregroundColor: primaryColor.withOpacity(0.8),
                  cacheImage: true,
                  imageFit: BoxFit.cover,
                  animateFromOldImageOnUrlChange: true,
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Cảm ơn bạn",
                  style: TextStyle(
                      fontSize: defautfontsize + 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Hãy thưởng thức !",
                  style: TextStyle(
                      fontSize: defautfontsize + 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Vui lòng đánh giá về nhà hàng",
                  style: TextStyle(
                    fontSize: defautfontsize,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                RatingBar(
                    initialRating: 5,
                    allowHalfRating: true,
                    minRating: 1,
                    maxRating: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 10),
                    ratingWidget: RatingWidget(
                        empty: SvgPicture.asset(
                          "assets/icons/no_star.svg",
                          width: MediaQuery.of(context).size.width * 0.09,
                        ),
                        full: SvgPicture.asset("assets/icons/star.svg",
                            width: MediaQuery.of(context).size.width * 0.09),
                        half: SvgPicture.asset("assets/icons/half_star.svg",
                            width: MediaQuery.of(context).size.width * 0.09)),
                    onRatingUpdate: (rating) => controller.onRate(rating)),
                const Spacer(
                  flex: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(text: "Đồng ý", onPress: controller.onSubmit),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomButton(
                        gradient: const LinearGradient(
                            colors: [Colors.black12, Colors.black45]),
                        text: "Bỏ qua",
                        onPress: controller.onNext),
                  ],
                ),
                const Spacer(),
              ],
            ),
          )
        ],
      )),
    );
  }
}
