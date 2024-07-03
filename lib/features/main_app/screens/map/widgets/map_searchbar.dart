import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tros/features/main_app/screens/map/models/auto_complete_result.dart';

import '../../../../../common/widgets/appbar/searchBar.dart';
import '../../../../../services/map/map_services.dart';

class MapSearchBar extends StatefulWidget {
  const MapSearchBar({
    super.key,
  });

  @override
  State<MapSearchBar> createState() => _MapSearchBarState();
}

class _MapSearchBarState extends State<MapSearchBar> {
  // get instance of map sservices service
  final mapController = TMapService.instance;
  // Debounce to throttle async calls during search
  Timer? _debounce;
  @override
  Widget build(BuildContext context) {
    return TSearchBar(
      usePrefixSuffix: true,
      hintText: 'Search for nearby smart bin',
      prefixWidget: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.filter_list_outlined),
      ),
      onChanged: (value) async {
        List<AutoCompleteResult> searchResults =
            await mapController.searchPlaces(value);
        mapController.setResults(searchResults);
        if (_debounce?.isActive ?? false) {
          _debounce?.cancel();
          _debounce = Timer(const Duration(milliseconds: 700), () async {
            // await Future.delayed(Duration(milliseconds: 700));
            if (value.length > 2) {
              // if (!mapController.searchToggle.value) {
              //   mapController.searchToggle.value = true;
              //   // !mapController.searchToggle.value;
              //   mapController.markers = {};
              // }

              List<AutoCompleteResult> searchResults =
                  await mapController.searchPlaces(value);
              mapController.setResults(searchResults);

              // if (searchResults.length != 0) {}
            } else {
              List<AutoCompleteResult> emptyList = [];
              mapController.setResults(emptyList);
            }
            // setState(() {});
          });
        }
      },
    );
  }
}
