import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardItem extends StatelessWidget {
  const OnboardItem({
    Key? key,
    required this.svgAsset,
    required this.tittle,
    required this.subTittle,
  }) : super(key: key);

  final String svgAsset;
  final String tittle;
  final String subTittle;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Column(
            children: [
              const Spacer(
                flex: 1,
              ),
              SvgPicture.asset(
                svgAsset,
                height: size.height * 0.4,
              ),
              const Spacer(
                flex: 1,
              ),
              Text(
                tittle,
                style: const TextStyle(
                  fontFamily: "Righteus",
                  fontSize: defautfontsize + 40,
                  color: primaryColor,
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Text(
                subTittle,
                style: const TextStyle(
                    fontSize: defautfontsize + 10, fontWeight: FontWeight.bold),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        )
      ],
    );
  }
}
