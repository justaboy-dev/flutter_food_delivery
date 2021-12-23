import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 80,
        width: 80,
        child: LoadingIndicator(colors: [
          primaryColor,
          primaryColor.withOpacity(0.2),
          primaryColor.withOpacity(0.4),
          primaryColor.withOpacity(0.6),
          primaryColor.withOpacity(0.8),
        ], indicatorType: Indicator.ballSpinFadeLoader),
      ),
    );
  }
}
