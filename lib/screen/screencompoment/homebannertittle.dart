import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';

class HomeBannerTittle extends StatelessWidget {
  const HomeBannerTittle({
    Key? key,
    required this.tittle,
    required this.onNext,
  }) : super(key: key);

  final String tittle;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 12, top: 10),
        child: GestureDetector(
          onTap: onNext,
          child: Row(
            children: [
              Text(
                tittle,
                style: const TextStyle(
                  color: primaryColor,
                  fontSize: defautfontsize + 7,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Righteous",
                ),
              ),
              const Spacer(),
              const Text(
                "Xem thêm",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: defautfontsize,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Righteous",
                ),
              ),
              Icon(
                Icons.navigate_next,
                color: primaryColor,
                size: size.width * 0.08,
              )
            ],
          ),
        ),
      ),
    );
  }
}
