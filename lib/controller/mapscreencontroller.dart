import 'package:flutter_food_delivery_v1/model/billmodel.dart';
import 'package:flutter_food_delivery_v1/service/authencation.dart';
import 'package:flutter_food_delivery_v1/service/location.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class MapScreenController extends GetxController {
  final Rx<Position> position = Position(
          longitude: 106.7157,
          latitude: 10.7982,
          timestamp: DateTime.now(),
          accuracy: 10,
          altitude: 1,
          heading: 1,
          speed: 1,
          speedAccuracy: 1)
      .obs;
  final Rx<Position> desposition = Position(
          longitude: 106.7157,
          latitude: 10.7982,
          timestamp: DateTime.now(),
          accuracy: 10,
          altitude: 1,
          heading: 1,
          speed: 1,
          speedAccuracy: 1)
      .obs;

  final RxList<LatLng> listpoint = <LatLng>[].obs;

  BillModel bill = Get.arguments;

  MapController mapController = MapController();

  @override
  void onInit() {
    super.onInit();
    onInitScreen();
    createPolyline();
  }

  void onInitScreen() async {
    LocationService().getLocation().then((value) {
      position.value = value;
      mapController.move(LatLng(value.latitude, value.longitude), 16);
    });
  }

  void createPolyline() async {
    if (bill.driverID.toString().isNotEmpty) {
      var user = await Authencation().getUserByID(bill.driverID.toString());
      desposition.value = Position(
          longitude: user.address!.longtitude,
          latitude: user.address!.lattitude,
          timestamp: DateTime.now(),
          accuracy: 10,
          altitude: 1,
          heading: 1,
          speed: 1,
          speedAccuracy: 1);
      listpoint.value = await LocationService()
          .getPoly(await LocationService().getLocation(), desposition.value);
    }
  }
}
