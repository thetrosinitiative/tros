import 'package:flutter/material.dart';
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
  // initialize the map position on load

  // Markers
  @override
  Widget build(BuildContext context) {
    final locationController = TGeolocator.instance;

    final mapController = TMapService.instance;

    final screenWidth = PDeviceUtils.getScreenWidth(context);
    final screenHeight = PDeviceUtils.getScreenHeight();
    debugPrint(locationController.latitude.value.toString());
    return TRoundedContainer(
      height: screenHeight,
      width: screenWidth,
      child: GoogleMap(
        // padding: const EdgeInsets.only(
        //   top: 600.0,
        // ),
        // zoomControlsEnabled: false,
        myLocationEnabled: true,
        // myLocationButtonEnabled: true,
        mapType: MapType.normal,
        markers: mapController.markers,
        initialCameraPosition: CameraPosition(
          target: LatLng(
              locationController.latitude.value,
              locationController.longitude
                  .value), // LatLng(_position!.latitude, _position!.latitude),
          zoom: 12,
        ),
        onMapCreated: (GoogleMapController controller) {
          mapController.controller.complete(controller);
        },
      ),
    );
  }
}
