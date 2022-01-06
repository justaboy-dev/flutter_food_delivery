import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_food_delivery_v1/model/billmodel.dart';
import 'package:flutter_food_delivery_v1/model/restaurantmodel.dart';
import 'package:get/get.dart';

class FetchData extends GetConnect {
  List<RestaurantModel> listRestaurant = [];
  List<BillModel> listBill = [];

  Future<List<RestaurantModel>> fetchRestaurant() async {
    var response = await get(dotenv.env["BASEURL"].toString() + "restaurant");
    if (response.statusCode == 200) {
      List<dynamic> m = jsonDecode(response.bodyString.toString());
      listRestaurant = m.map((e) => RestaurantModel.fromMap(e)).toList();
    }
    return listRestaurant;
  }

  Future<List<BillModel>> fetchBill() async {
    await Future.delayed(const Duration(seconds: 5));
    return listBill;
  }
}
