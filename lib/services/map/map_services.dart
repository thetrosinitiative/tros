import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tros/services/location/location_service.dart';
import 'package:tros/utils/http/http_client.dart';

import '../../features/main_app/screens/map/models/auto_complete_result.dart';

class TMapService extends GetxController {
  static TMapService get instance => Get.find();

  // final location = Get.put(TGeolocator());
  late final Completer<GoogleMapController> controller;
  final searchToggle = false.obs;
  final radiusSlider = false.obs;
  final pressedNear = false.obs;
  final cardTapped = false.obs;
  final getDirection = false.obs;

  // List of AutoCompleteResults
  List<AutoCompleteResult> allReturnedResults = <AutoCompleteResult>[].obs;
  // text controller
  final textController = TextEditingController();

  Set<Marker> markers = <Marker>{}.obs;
  final String key = 'AIzaSyCboPOg91E8s_GzXHXqyE_K7ToDLwE-7kU';
  // AIzaSyCboPOg91E8s_GzXHXqyE_K7ToDLwE-7kU
  final String types = 'geocode';
  // initialize permission
  @override
  onInit() async {
    await init().then((value) {
      controller = Completer();
    });
    super.onInit();
  }

  Future<void> init() async {
    final locator = Get.put(TGeolocator());
    await locator.getLatLang();
  }

  Future<List<AutoCompleteResult>> searchPlaces(String searchInput) async {
    final String url =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchInput&types=$types&key=$key";
    debugPrint(searchInput);
    final response = await THttpHelper.getM(url);
    final results = response['predictions'] as List;
    debugPrint(results.toString());

    return results.map((e) => AutoCompleteResult.fromMap(e)).toList();
  }

  Future<Map<String, dynamic>> getPlace(String? input) async {
    try {
      final String url =
          'https://maps.googleapis.com/maps/api/place/autocomplete/json?place_id=$input&keys=$key';
      debugPrint('search');

      final response = await THttpHelper.getM(url);
      debugPrint('search2');

      final results = response['results'] as Map<String, dynamic>;
      return results;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  // Set Location Results
  void setResults(allPlaces) {
    allReturnedResults = allPlaces;
    update();
  }

  resetController() {
    textController.clear();

    searchToggle.value = false;
    radiusSlider.value = false;
    pressedNear.value = false;
    cardTapped.value = false;
    getDirection.value = false;
  }
}
