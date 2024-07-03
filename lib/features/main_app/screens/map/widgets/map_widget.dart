import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tros/common/widgets/custom_shapes/containers/rounded_container.dart';

import '../../../../../services/location/location_service.dart';
import '../../../../../services/map/map_services.dart';
import '../../../../../utils/device/device_utility.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final locationController = TGeolocator.instance;
  final mapController = TMapService.instance;

  // initialize the map position on load

  // Markers
  @override
  Widget build(BuildContext context) {
    final screenWidth = PDeviceUtils.getScreenWidth(context);
    final screenHeight = PDeviceUtils.getScreenHeight();
    // debugPrint(_position!.latitude.toString());
    return TRoundedContainer(
      height: screenHeight,
      width: screenWidth,
      child: GoogleMap(
        mapType: MapType.normal,
        markers: mapController.markers,
        initialCameraPosition: CameraPosition(
          target: LatLng(
              locationController.latitude.value,
              locationController.latitude
                  .value), // LatLng(_position!.latitude, _position!.latitude),
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          mapController.controller.complete(controller);
        },
      ),
    );
  }
}
