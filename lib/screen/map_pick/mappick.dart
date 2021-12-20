import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapPick extends StatefulWidget {
  const MapPick({Key? key}) : super(key: key);

  @override
  _MapPickState createState() => _MapPickState();
}

late final Position latLng;

class _MapPickState extends State<MapPick> {
  Future<Position> getLocation() async {
    var serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error("Service doesn't enable");
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location access denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location access denied");
    }
    return Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();
    getLocation().then((position) {
      setState(() {
        latLng = position;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FlutterMap(
      options: MapOptions(
        center: LatLng(latLng.latitude, latLng.longitude),
        zoom: 15.0,
      ),
      layers: [
        TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        MarkerLayerOptions(
          rotate: true,
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(latLng.latitude, latLng.longitude),
              builder: (ctx) => const FlutterLogo(),
            ),
          ],
        ),
      ],
    ));
  }
}
