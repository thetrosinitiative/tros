import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tros/common/loaders/loaders.dart';
import 'package:tros/utils/http/http_client.dart';

import '../../features/main_app/screens/map/models/auto_complete_result.dart';

class TMapService extends GetxController {
  static TMapService get instance => Get.find();

  final Completer<GoogleMapController> controller = Completer();

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
  final String key = '';
  final String types = 'geocode';
  // initialize permission
  // @override
  // onInit() {
  //   super.onInit();
  // }

  Future<List<AutoCompleteResult>> searchPlaces(String searchInput) async {
    debugPrint('search');

    final String url =
        "http://maps.googleapis.com/maps/api/places/autocomplete/json?input=$searchInput&types=$types&key=$key";
    debugPrint(searchInput);
    final response = await THttpHelper.get(null, url);
    final results = response['predictions'] as List;
    debugPrint(response.toString());

    return results.map((e) => AutoCompleteResult.fromJson(e)).toList();
  }

  Future<Map<String, dynamic>> getPlace(String? input) async {
    try {
      final String url =
          'https://maps.googleapis.com/maps/api/places/autocomplete/json?place_id=$input&keys=$key';
      debugPrint('search');

      final response = await THttpHelper.get(null, url);
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
