// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/controller/mapscreencontroller.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    MapScreenController controller = Get.put(MapScreenController());
    return Container(
      padding: const EdgeInsets.all(15),
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: primaryColor.withOpacity(0.2)),
            child: IconButton(
              icon: Icon(
                Icons.chevron_left,
                size: size.width * 0.07,
                color: primaryColor,
              ),
              onPressed: () => Get.back(),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Stack(
            children: [
              Obx(
                () => FlutterMap(
                  mapController: controller.mapController,
                  options: MapOptions(
                    center: LatLng(controller.position.value.latitude,
                        controller.position.value.longitude),
                    zoom: 14.0,
                    maxZoom: 17,
                  ),
                  layers: [
                    TileLayerOptions(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c']),
                    MarkerLayerOptions(
                      rotate: true,
                      markers: [
                        Marker(
                          width: 30.0,
                          height: 30.0,
                          point: LatLng(controller.position.value.latitude,
                              controller.position.value.longitude),
                          builder: (ctx) => SvgPicture.asset(
                            "assets/icons/location.svg",
                          ),
                          anchorPos: AnchorPos.align(AnchorAlign.top),
                        ),
                      ],
                    ),
                    MarkerLayerOptions(
                      rotate: true,
                      markers: [
                        Marker(
                            width: 30.0,
                            height: 30.0,
                            point: LatLng(controller.desposition.value.latitude,
                                controller.desposition.value.longitude),
                            builder: (ctx) => SvgPicture.asset(
                                  "assets/icons/delivery-motorbike.svg",
                                ),
                            anchorPos: AnchorPos.align(AnchorAlign.top)),
                      ],
                    ),
                    PolylineLayerOptions(
                      polylines: [
                        Polyline(
                            points: controller.listpoint.value,
                            color: Colors.green,
                            strokeWidth: 4)
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
