import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_food_delivery_v1/model/usermodel.dart';
import 'package:flutter_food_delivery_v1/screen/mainscreen/mainscreen.dart';
import 'package:flutter_food_delivery_v1/screen/onboardscreen/onboard.dart';
import 'package:flutter_food_delivery_v1/screen/welcome/welcome.dart';
import 'package:flutter_food_delivery_v1/service/getstorage.dart';
import 'package:get/get.dart';

class Authencation extends GetConnect {
  Future<Response> checkExitPhoneNumber(String phoneNumber) async {
    Response response;
    response = await post(dotenv.env["BASEURL"].toString() + "user/checkexist",
        {"PhoneNumber": phoneNumber});
    return response;
  }

  Future<Response> signUp(UserModel user) async {
    Response res;
    res = await post(
      dotenv.env["BASEURL"].toString() + "auth/signup",
      user.toMap(),
    );
    if (res.body["success"] as bool) {
      httpClient.addAuthenticator((request) =>
          request.headers['Authorization'] =
              jsonDecode(res.bodyString.toString())["token"]);
      GetStorageService().writeFirstLogin(false);
      await saveUser(user.phoneNumber.toString());
    }
    return res;
  }

  Future<Response> signIn(String phoneNumber, String password) async {
    Response res;
    res = await post(dotenv.env["BASEURL"].toString() + "auth/signin", {
      "PhoneNumber": phoneNumber,
      "Password": password,
    });
    if (res.body["success"] as bool) {
      httpClient.addAuthenticator((request) =>
          request.headers['Authorization'] =
              jsonDecode(res.bodyString.toString())["token"]);
      GetStorageService().writeFirstLogin(false);
      await saveUser(phoneNumber);
    }
    return res;
  }

  Future<void> saveUser(String phoneNumber) async {
    Response res;
    res = await post(dotenv.env["BASEURL"].toString() + "user/getbyphone", {
      "PhoneNumber": phoneNumber,
    });
    if (res.statusCode == 200) {
      GetStorageService()
          .writeUser(UserModel.fromMap(jsonDecode(res.bodyString.toString())));
    }
  }

  Widget handleLogin() {
    bool isLogin = GetStorageService().readIsLogin();
    if (isLogin) {
      return const HomePageSreen();
    } else {
      bool isFirstLogin = GetStorageService().readFirstLogin();
      if (isFirstLogin) {
        return const OnboardScreen();
      } else {
        return const WelComeScreen();
      }
    }
  }
}
