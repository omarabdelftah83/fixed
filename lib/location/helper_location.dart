import 'package:location/location.dart';

class LocationService {
  final Location _location = Location();

  /// **1. Check if location services are enabled**
  Future<void> checkEnabledServices() async {
    bool servicesEnabled = await _location.serviceEnabled();
    if (!servicesEnabled) {
      bool serviceRequested = await _location.requestService();
      if (!serviceRequested) {
        throw Exception('Location services are not enabled.');
      }
    }
  }

  /// **2. Check and request location permissions**
  Future<void> checkPermission() async {
    PermissionStatus permission = await _location.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await _location.requestPermission();
      if (permission != PermissionStatus.granted) {
        throw Exception('Location permission denied');
      }
    }
  }

  /// **3. Get location updates stream**
  Stream<LocationData> getLocationUpdates() {
    return _location.onLocationChanged;
  }


}
