import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    Key? key,
    required this.hintText,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  final String hintText;
  final TextEditingController? controller;
  final ValueChanged? onChanged;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
          border: InputBorder.none,
          icon: const Icon(
            Icons.lock,
            color: primaryColor,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isObscureText = !isObscureText;
              });
            },
            icon: isObscureText
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
            color: primaryColor,
          ),
          hintText: widget.hintText),
      obscureText: isObscureText,
      obscuringCharacter: "*",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Không được để trống";
        }
      },
    );
  }
}
