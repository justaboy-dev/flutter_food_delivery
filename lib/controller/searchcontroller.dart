// ignore_for_file: invalid_use_of_protected_member

import 'package:elastic_client/elastic_client.dart';
import 'package:flutter_food_delivery_v1/model/foodmodel.dart';
import 'package:flutter_food_delivery_v1/service/fetchdata.dart';
import 'package:flutter_food_delivery_v1/service/location.dart';
import 'package:get/get.dart';

class SearchController extends GetxController with StateMixin {
  RxList<FoodModel> listsearch = <FoodModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadSearch();
  }

  void loadSearch() async {
    change(null, status: RxStatus.loading());
    SearchResult data = Get.arguments;
    if (data.hits.isEmpty) {
      change(null, status: RxStatus.empty());
    } else {
      for (var item in data.hits) {
        FoodModel f = FoodModel.fromMap(item.doc);
        f.foodID = item.id;

        var res = await FetchData().getByFoodID(f.foodID);
        var distance = double.parse(((await LocationService()
                    .getDistancebetween(res.restaurantAddress.lattitude,
                        res.restaurantAddress.longtitude) /
                1000)
            .toStringAsFixed(1)));
        f.foodSpace = distance;
        f.foodMinute = double.parse((distance / 40 + 10).toStringAsFixed(1));
        listsearch.value.add(f);
      }
      change(null, status: RxStatus.success());
    }
  }
}
