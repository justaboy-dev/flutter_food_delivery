import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NormalTextField extends StatelessWidget {
  const NormalTextField({
    Key? key,
    required this.hintText,
    this.isEmail = false,
    this.iconData,
    this.acceptNull = false,
    this.inputType = TextInputType.text,
    this.maxleght,
  }) : super(key: key);

  final String hintText;
  final IconData? iconData;
  final bool isEmail;
  final bool acceptNull;
  final TextInputType inputType;
  final int? maxleght;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      inputFormatters:
          maxleght == null ? [] : [LengthLimitingTextInputFormatter(maxleght)],
      keyboardType: inputType,
      decoration: InputDecoration(border: InputBorder.none, hintText: hintText),
      validator: (value) {
        if (!acceptNull) {
          if (value == null || value.isEmpty) {
            return "Không được để trống";
          }
        }
      },
    );
  }
}
