import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({
    Key? key,
    required this.child,
    this.radius = 30,
    this.margin = 10,
    this.padding = 10,
  }) : super(key: key);

  final Widget child;
  final double radius;
  final double margin;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: margin, horizontal: margin / 2),
        padding:
            EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
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
