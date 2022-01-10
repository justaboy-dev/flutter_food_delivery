import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_food_delivery_v1/model/billmodel.dart';
import 'package:flutter_food_delivery_v1/model/foodmodel.dart';
import 'package:flutter_food_delivery_v1/model/restaurantmodel.dart';
import 'package:flutter_food_delivery_v1/model/usermodel.dart';
import 'package:flutter_food_delivery_v1/service/elasticsearch.dart';
import 'package:flutter_food_delivery_v1/service/getstorage.dart';
import 'package:get/get.dart';

class FetchData extends GetConnect {
  List<RestaurantModel> listRestaurant = [];
  List<FoodModel> listFood = [];
  List<BillModel> listBill = [];

  Future<List<RestaurantModel>> fetchRestaurant() async {
    var response = await get(dotenv.env["BASEURL"].toString() + "restaurant");
    if (response.status.isOk) {
      List<dynamic> m = jsonDecode(response.bodyString.toString());
      listRestaurant = m.map((e) => RestaurantModel.fromMap(e)).toList();
    }
    return listRestaurant;
  }

  Future<RestaurantModel> getByFoodID(String foodID) async {
    var response = await get(
        dotenv.env["BASEURL"].toString() + "restaurant/getbyfood/" + foodID);
    if (response.status.isOk) {
      return RestaurantModel.fromMap(
          jsonDecode(response.bodyString.toString()));
    }
    return Future.error("Not found");
  }

  Future<RestaurantModel> getRestaurantByID(String restaurantID) async {
    var response = await get(
        dotenv.env["BASEURL"].toString() + "restaurant/" + restaurantID);
    if (response.status.isOk) {
      return RestaurantModel.fromMap(
          jsonDecode(response.bodyString.toString()));
    }
    return Future.error("Not found");
  }

  Future<List<FoodModel>> fetchFood() async {
    var response = await get(dotenv.env["BASEURL"].toString() + "food");
    if (response.status.isOk) {
      List<dynamic> m = jsonDecode(response.bodyString.toString());
      listFood = m.map((e) => FoodModel.fromMap(e)).toList();
      ElasticService().updateDocument(listFood);
    }
    return listFood;
  }

  Future<List<FoodModel>> getByRestaurantID(String restaurantID) async {
    var response = await get(
        dotenv.env["BASEURL"].toString() + "food/getbyres/" + restaurantID);
    if (response.status.isOk) {
      List<dynamic> f = jsonDecode(response.bodyString.toString());
      return f.map((e) => FoodModel.fromMap(e)).toList();
    }
    return Future.error("Not found");
  }

  Future<List<BillModel>> fetchBill() async {
    UserModel user = GetStorageService().readUser();
    var response = await get(dotenv.env["BASEURL"].toString() +
        "bill/getbillbyuserid/" +
        user.userID.toString());
    if (response.status.isOk) {
      List<dynamic> f = jsonDecode(response.bodyString.toString());
      return f.map((e) => BillModel.fromMap(e)).toList();
    } else {
      return Future.error("error");
    }
  }

  Future<bool> postBill(BillModel bill) async {
    var response = await post(
        dotenv.env["BASEURL"].toString() + "/bill", jsonEncode(bill.toMap()));
    if (response.statusCode == 201) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  Future<BillModel> getBillByID(String billID) async {
    var response =
        await get(dotenv.env["BASEURL"].toString() + "/bill/" + billID);

    if (response.statusCode == 200) {
      return BillModel.fromMap(jsonDecode(response.bodyString.toString()));
    } else {
      return Future.error("");
    }
  }

  Future<FoodModel> getFoodByID(String foodID) async {
    var response =
        await get(dotenv.env["BASEURL"].toString() + "/food/" + foodID);

    if (response.statusCode == 200) {
      return FoodModel.fromMap(jsonDecode(response.bodyString.toString()));
    } else {
      return Future.error("");
    }
  }
}
