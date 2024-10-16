import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;

class LocationService {
  final loc.Location _location = loc.Location();
  loc.LocationData? _currentLocation;

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
    loc.PermissionStatus permission = await _location.hasPermission();
    if (permission == loc.PermissionStatus.denied) {
      permission = await _location.requestPermission();
      if (permission != loc.PermissionStatus.granted) {
        throw Exception('Location permission denied');
      }
    }
  }

  /// **3. Get the current location**
  Future<void> getCurrentLocation() async {
    _currentLocation = await _location.getLocation();
  }

  /// **4. Get address from current latitude and longitude**
  Future<String> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks[0];

      var currentAddress = "${place.locality}, ${place.country}";
      return currentAddress;
    } catch (e) {
      rethrow;
    }
  }}
