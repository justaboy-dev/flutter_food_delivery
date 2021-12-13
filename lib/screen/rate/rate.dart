import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

class Rate extends StatefulWidget {
  const Rate({Key? key, required this.tittle, required this.subtittle})
      : super(key: key);

  final String tittle;
  final String subtittle;
  @override
  _RateState createState() => _RateState();
}

class _RateState extends State<Rate> {
  @override
  Widget build(BuildContext context) {
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
                Text(
                  widget.tittle,
                  style: const TextStyle(
                      fontSize: defautfontsize + 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Vui lòng đánh giá " + widget.subtittle,
                  style: const TextStyle(
                    fontSize: defautfontsize,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SimpleStarRating(
                  rating: 5,
                  spacing: 20,
                  filledIcon: SvgPicture.asset(
                    "assets/icons/star.svg",
                    width: MediaQuery.of(context).size.width * 0.09,
                  ),
                  nonFilledIcon: Container(
                    width: 0,
                  ),
                  size: 30,
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
