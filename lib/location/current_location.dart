import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:webbing_fixed/location/helper_location.dart';
import 'package:geolocator/geolocator.dart';

class CurrentLocationPage extends StatefulWidget {
  const CurrentLocationPage({Key? key}) : super(key: key);

  @override
  _CurrentLocationPageState createState() => _CurrentLocationPageState();
}

class _CurrentLocationPageState extends State<CurrentLocationPage> {
  static Position? position;
  Completer<GoogleMapController> googleMapController = Completer();
  CameraPosition? cameraPosition;

  @override
  void initState() {
    super.initState();
    getMyLocation();
  }

  Future<void> getMyLocation() async {
    await LocationService().checkEnabledServices();
    await LocationService().checkPermission();
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    if (position != null) {
      setState(() {
        cameraPosition = CameraPosition(
          target: LatLng(position!.latitude, position!.longitude),
          zoom: 17,
        );
      });
    } else {
      print("Unable to retrieve the location.");
    }
  }

  Future<void> goToMyCurrentLocation() async {
    if (cameraPosition != null) {
      final GoogleMapController controller = await googleMapController.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition!));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('موقعي الحالي'),
      ),
      body: cameraPosition == null
          ? const Center(child: CircularProgressIndicator()) // Loading state
          : GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: cameraPosition!,
        onMapCreated: (GoogleMapController controller) {
          googleMapController.complete(controller);
        },
        markers: {
          Marker(
            markerId: const MarkerId('currentLocation'),
            position: LatLng(position!.latitude, position!.longitude),
          ),
        },
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 8, 30),
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: goToMyCurrentLocation,
          child: const Icon(Icons.place, color: Colors.white),
        ),
      ),
    );
  }
}

