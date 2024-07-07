import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:tros/common/loaders/loaders.dart';
import 'package:tros/services/map/map_services.dart';

import '../../features/main_app/screens/map/models/auto_complete_result.dart';

class TGeolocator extends GetxController {
  static TGeolocator get instance => Get.find();

  late LocationPermission _permission;
  final permissionEnabled = false.obs;
  final latitude = 0.0.obs;
  final longitude = 0.0.obs;

  // initialize permission
  @override
  onInit() {
    init();
    super.onInit();
  }
// @override

  Future<void> init() async {
    await getLatLang();

    // Get.put(TMapService());
    debugPrint(latitude.value.toString());
    debugPrint(longitude.value.toString());
  }

// Check for permission to access the device location and get the current permissions
  Future<bool> _determinePosition() async {
    bool serviceEnabled;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (permissionEnabled.value) return true;
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    _permission = await Geolocator.checkPermission();
    if (_permission == LocationPermission.denied) {
      permissionEnabled.value = false;

      _permission = await Geolocator.requestPermission();
      if (_permission == LocationPermission.denied) {
        // do something
        permissionEnabled.value = false;
        PLoaders.errorSnackBar(
            title: "Ooops!", message: 'Location permissions are denied');
        return permissionEnabled.value = false;
      }
    }
    if (_permission == LocationPermission.deniedForever) {
      // do something

      PLoaders.errorSnackBar(
          title: "Ooops!",
          message: 'Location permissions are permanently denied');
      return permissionEnabled.value = false;
    }
    return permissionEnabled.value = true;
  }

  // Get the current position of the device
  Future<Position> _getPosition() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }

  getLatLang() async {
    final hasPermission = await _determinePosition();
    if (!hasPermission) return;
    await _getPosition().then((Position position) {
      longitude(position.longitude);
      debugPrint(latitude.value.toString());

      latitude(position.latitude);
      update();
    });
  }

  // Get Last position of the device
  Future<Position?> getLastPosition() async {
    if (permissionEnabled.isTrue) {
      Position? lastPosition = await Geolocator.getLastKnownPosition();
      return lastPosition;
    }
    return null;
  }
}
