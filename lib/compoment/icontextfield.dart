import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';

class IconTextField extends StatelessWidget {
  const IconTextField({
    Key? key,
    required this.hintText,
    this.isEmail = false,
    required this.iconData,
  }) : super(key: key);

  final String hintText;
  final IconData iconData;
  final bool isEmail;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            iconData,
            color: primaryColor,
          ),
          hintText: hintText),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Không được để trống";
        }
        if (isEmail) {
          if (!EmailValidator.validate(value)) {
            return "Email không đúng định dạng";
          }
        }
      },
    );
  }
}