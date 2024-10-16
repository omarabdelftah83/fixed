import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:webbing_fixed/features_user/home/controll/home_user_cubit.dart';
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
  String _currentAddress = ''; // لعرض العنوان
  @override
  void initState() {
    super.initState();
    getMyLocation();
  }

  Future<void> getMyLocation() async {
    await LocationService().checkEnabledServices();
    await LocationService().checkPermission();
    ///****get current location ****///
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    if (position != null) {
      final cubit = context.read<HomeUserCubit>();
      cubit.setCurrentLocation(position!.latitude, position!.longitude);
   ///****  convert current location to address ****////
      final locationService = LocationService();
      _currentAddress = await locationService.getAddressFromLatLng(
          position!.latitude, position!.longitude);
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
          ? const Center(child: CircularProgressIndicator()) // حالة التحميل
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, _currentAddress); // إعادة العنوان عند الرجوع
            },
            child: const Text('تأكيد الموقع'),
          ),
          FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: goToMyCurrentLocation,
            child: const Icon(Icons.place, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
