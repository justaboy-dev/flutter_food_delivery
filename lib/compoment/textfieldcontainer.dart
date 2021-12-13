import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: size.width * 0.8,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
              color: Colors.black12,
              spreadRadius: 0,
              blurRadius: 20,
              blurStyle: BlurStyle.solid,
              offset: Offset(-1.0, 1.0))
        ], borderRadius: BorderRadius.circular(30), color: Colors.white),
        child: child);
  }
}
