import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:open_route_service/open_route_service.dart';

class LocationService {
  Position position = Position(
      longitude: 1,
      latitude: 1,
      timestamp: DateTime.now(),
      accuracy: 10,
      altitude: 1,
      heading: 1,
      speed: 1,
      speedAccuracy: 1);

  final OpenRouteService client =
      OpenRouteService(apiKey: dotenv.env["OPENROUTEAPIKEY"].toString());

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

  Future<double> getDistancebetween(double latitude, double longtitude) async {
    var currentLocation = await getLocation();
    var distance = Geolocator.distanceBetween(currentLocation.latitude,
        currentLocation.longitude, latitude, longtitude);
    return distance;
  }

  Future<List<LatLng>> getPoly(Position start, Position end) async {
    final List<ORSCoordinate> routeCoordinates =
        await client.directionsRouteCoordsGet(
      startCoordinate:
          ORSCoordinate(latitude: start.latitude, longitude: start.longitude),
      endCoordinate:
          ORSCoordinate(latitude: end.latitude, longitude: end.longitude),
      //ORSCoordinate(latitude: end.latitude, longitude: end.longitude),
    );

    final List<LatLng> routePoints = routeCoordinates
        .map((coordinate) => LatLng(coordinate.latitude, coordinate.longitude))
        .toList();
    return routePoints;
  }
}
