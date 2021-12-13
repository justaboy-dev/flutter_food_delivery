import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({
    Key? key,
    required this.child,
    this.radius = 30,
  }) : super(key: key);

  final Widget child;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
              color: Colors.black12,
              spreadRadius: 0,
              blurRadius: 10,
              blurStyle: BlurStyle.solid,
              offset: Offset(0, 1.0))
        ], borderRadius: BorderRadius.circular(radius), color: Colors.white),
        child: child);
  }
}
