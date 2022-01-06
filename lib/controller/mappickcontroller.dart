import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/service/location.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class MappickController extends GetxController {
  final Rx<Position> position = Position(
          longitude: 1,
          latitude: 1,
          timestamp: DateTime.now(),
          accuracy: 10,
          altitude: 1,
          heading: 1,
          speed: 1,
          speedAccuracy: 1)
      .obs;
  final MapController mapController = MapController();
  final TextEditingController textEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    moveLocation();
  }

  @override
  void onClose() {
    super.onClose();
    textEditingController.dispose();
  }

  void moveLocation() {
    LocationService().getLocation().then((value) {
      position.value = value;
      mapController.move(LatLng(value.latitude, value.longitude), 17);
    });
    update();
  }

  void onSearch() {
    if (textEditingController.text.isNotEmpty) {
      locationFromAddress(textEditingController.text + ", VN")
          .then((List<Location> value) {
        position.value = Position(
            longitude: value[0].longitude,
            latitude: value[0].latitude,
            timestamp: position.value.timestamp,
            accuracy: position.value.accuracy,
            altitude: position.value.altitude,
            heading: position.value.heading,
            speed: position.value.speed,
            speedAccuracy: position.value.speedAccuracy);
        mapController.move(LatLng(value[0].latitude, value[0].longitude), 17);
      });
      update();
    }
  }

  void onLocationChanged(MapPosition changeposition, bool hasGesture) {
    if (hasGesture) {
      position.value = Position(
          longitude: changeposition.center!.longitude,
          latitude: changeposition.center!.latitude,
          timestamp: position.value.timestamp,
          accuracy: position.value.accuracy,
          altitude: position.value.altitude,
          heading: position.value.heading,
          speed: position.value.speed,
          speedAccuracy: position.value.speedAccuracy);
    }
    // print(await placemarkFromCoordinates(
    //     position.center!.latitude, position.center!.longitude));
  }

  void onNext() async {
    Get.back(result: position.value);
  }
}
