import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPress,
    this.width = 150,
    this.textColor = Colors.white,
    this.gradient = linnear,
  }) : super(key: key);

  final String text;
  final VoidCallback onPress;
  final double width;
  final Color textColor;
  final LinearGradient gradient;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), gradient: gradient),
      child: TextButton(
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
              color: textColor,
              fontSize: defautfontsize + 3,
              fontWeight: FontWeight.bold),
        ),
        onPressed: onPress,
      ),
    );
  }
}
