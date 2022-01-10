import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';

class IconTextField extends StatelessWidget {
  const IconTextField({
    Key? key,
    required this.hintText,
    this.isEmail = false,
    required this.iconData,
    this.controller,
    this.onChanged,
    required this.inputType,
    this.maxleght,
    this.onTap,
    this.onSubmit,
  }) : super(key: key);

  final String hintText;
  final IconData iconData;
  final bool isEmail;
  final TextEditingController? controller;
  final ValueChanged? onChanged;
  final TextInputType inputType;
  final int? maxleght;
  final VoidCallback? onTap;
  final Function(String value)? onSubmit;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      onChanged: onChanged,
      onFieldSubmitted: (value) =>
          onSubmit == null ? onSubmit : onSubmit!(value),
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      inputFormatters:
          maxleght == null ? [] : [LengthLimitingTextInputFormatter(maxleght)],
      keyboardType: inputType,
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
