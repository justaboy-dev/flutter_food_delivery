import 'dart:convert';

import 'package:flutter_food_delivery_v1/model/addressmodel.dart';
import 'package:flutter_food_delivery_v1/model/foodmodel.dart';
import 'package:flutter_food_delivery_v1/model/usermodel.dart';
import 'package:get_storage/get_storage.dart';

class GetStorageService {
  GetStorage box = GetStorage();
  void writeFirstLogin(bool value) {
    box.write("isFirstLogin", value);
  }

  bool readFirstLogin() {
    return box.read("isFirstLogin") ?? true;
  }

  void writeIsLogin(bool value) {
    box.write("isLogin", value);
  }

  bool readIsLogin() {
    return box.read("isLogin") ?? false;
  }

  void writeUser(UserModel userModel) {
    box.write("currentUser", jsonEncode(userModel.toMap()));
  }

  UserModel readUser() {
    var result = box.read("currentUser");
    if (result == null) {
      return UserModel("", "", "", "", "", "", false, Address(0, 0, ""));
    } else {
      UserModel user = UserModel.fromMap(jsonDecode(result));
      return user;
    }
  }

  List<FoodModel> getFromStorage() {
    var user = readUser();
    var item = box.read(user.userID.toString());
    List<FoodModel> listFoodFromStorage = [];
    if (item == null) {
      return listFoodFromStorage;
    } else {
      dynamic decode = jsonDecode(item);
      listFoodFromStorage =
          decode.map<FoodModel>((e) => FoodModel.fromMap(e)).toList();
    }
    return listFoodFromStorage;
  }

  void pushToStorage(List<FoodModel> pushItem) {
    var user = readUser();
    box.write(user.userID.toString(),
        jsonEncode(pushItem.map((e) => e.toMap()).toList()));
  }
}
