import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/compoment/button.dart';
import 'package:flutter_food_delivery_v1/compoment/normaltextfield.dart';
import 'package:flutter_food_delivery_v1/controller/mappickcontroller.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class MapPick extends StatefulWidget {
  const MapPick({Key? key}) : super(key: key);

  @override
  _MapPickState createState() => _MapPickState();
}

class _MapPickState extends State<MapPick> {
  final MappickController controller = Get.put(MappickController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: NormalTextField(
          controller: controller.textEditingController,
          hintText: "Tìm kiếm",
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: controller.onSearch,
              icon: SvgPicture.asset(
                "assets/icons/search.svg",
                width: size.width * 0.08,
              ))
        ],
      ),
      body: Stack(
        children: [
          Obx(() => FlutterMap(
                mapController: controller.mapController,
                options: MapOptions(
                  onPositionChanged: (position, hasGesture) {
                    controller.onLocationChanged(position, hasGesture);
                  },
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
                  MarkerLayerOptions(rotate: true, markers: [
                    Marker(
                      width: 30.0,
                      height: 30.0,
                      point: LatLng(controller.position.value.latitude,
                          controller.position.value.longitude),
                      builder: (ctx) => SvgPicture.asset(
                        "assets/icons/location.svg",
                      ),
                    )
                  ])
                ],
              )),
          Positioned(
              bottom: 0,
              left: 20,
              right: 20,
              child: CustomButton(text: "Chọn", onPress: () {})),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: IconButton(
            onPressed: controller.moveLocation,
            icon: const Icon(Icons.my_location_rounded)),
      ),
    );
  }
}
