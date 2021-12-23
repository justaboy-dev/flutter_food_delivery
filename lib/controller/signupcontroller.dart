import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  Rx<String> username = "".obs;
  Rx<String> phoneNumber = "".obs;
  Rx<String> password = "".obs;
  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();

  void onSignUp() {}
}
