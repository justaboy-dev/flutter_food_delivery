import 'package:geolocator/geolocator.dart';

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
}
