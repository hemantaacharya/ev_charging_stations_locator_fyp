import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are disabled
      bool enableService = await Geolocator.openLocationSettings();
      if (!enableService) {
        throw Exception('Please enable location services.');
      }
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Location permission is denied
        bool openSettings = await openAppSettings();
        if (!openSettings) {
          throw Exception('Please grant location permission.');
        }
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Location permissions are permanently denied
      bool openSettings = await openAppSettings();
      if (!openSettings) {
        throw Exception('Location permissions are permanently denied.');
      }
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
  }
}
