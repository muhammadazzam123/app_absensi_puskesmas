import 'package:geolocator/geolocator.dart';

class LocationService {
  checkLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission = await Geolocator.checkPermission();

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled ||
        permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }
  }

  Future<Position> getUserCurrentPosition() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}