import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FillBioController extends GetxController {
  Rx<String> fullname = "".obs;
  Rx<String> emailAddress = "".obs;
  final formKey = GlobalKey<FormState>();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  void onNext() {}
}
