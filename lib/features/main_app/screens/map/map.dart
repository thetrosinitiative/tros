import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tros/common/styles/spacing_styles.dart';
import 'package:tros/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tros/services/location/location_service.dart';
import 'package:tros/utils/constants/colors.dart';
import 'package:tros/utils/constants/sizes.dart';

import '../../../../services/map/map_services.dart';
import '../../../../utils/device/device_utility.dart';
import 'models/auto_complete_result.dart';
import 'widgets/map_searchbar.dart';
import 'widgets/map_widget.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  int markerIdCounter = 1;

  @override
  Widget build(BuildContext context) {
    final mapController = Get.put(TMapService());

    final screenWidth = PDeviceUtils.getScreenWidth(context);
    return Scaffold(
      backgroundColor: PColors.light,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const MapWidget(),
            Padding(
              padding: PSpacingStyle.paddingWithAppBarHeight,
              child: Column(
                children: [
                  const MapSearchBar(),
                  mapController.allReturnedResults.isNotEmpty
                      ? Positioned(
                          top: 100,
                          left: 15,
                          child: Container(
                            height: 200,
                            width: screenWidth - 30.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white.withOpacity(0.7),
                            ),
                            child: ListView(
                              children: [
                                ...mapController.allReturnedResults.map((e) =>
                                    buildListItem(
                                        e, mapController.searchToggle, context))
                              ],
                            ),
                          ))
                      : const SizedBox(),
                  const SizedBox(
                    height: PSizes.spaceBtwItems,
                  ),
                  Stack(
                    children: [
                      TRoundedContainer(
                        width: 300,
                        height: 40,
                        backgroundColor: PColors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 40),
                          child: Text(
                            'List',
                            textAlign: TextAlign.end,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ),
                      TRoundedContainer(
                        width: 150,
                        height: 40,
                        backgroundColor: PColors.primary,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 40),
                          child: Text(
                            'Map',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(color: PColors.light),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _setMarker(point) {
    final mapController = TMapService.instance;

    var counter = markerIdCounter++;
    final Marker marker = Marker(
        markerId: MarkerId('marker _$counter'),
        position: point,
        onTap: () {},
        icon: BitmapDescriptor.defaultMarker);
    setState(() {
      mapController.markers.add(marker);
    });
  }

  //
  Future<void> goToSearchedPlace(double lat, double lng) async {
    final mapController = TMapService.instance;

    final GoogleMapController controller =
        await mapController.controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 12)));
    _setMarker(LatLng(lat, lng));
  }

  Widget buildListItem(
      AutoCompleteResult placeItem, searchFlag, BuildContext context) {
    final screenWidth = PDeviceUtils.getScreenWidth(context);
    final mapController = Get.put(TMapService());

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
          onTapDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          onTap: () async {
            var place = await mapController.getPlace(placeItem.placeId);
            goToSearchedPlace(place['geometry']['location']['lat'],
                place['geometry']['location']['lat']);
            mapController.searchToggle.value;
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.green,
                size: 25.0,
              ),
              const SizedBox(
                width: PSizes.spaceBtwItems,
              ),
              SizedBox(
                height: 40.0,
                width: screenWidth - 75.0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(placeItem.description ?? ''),
                ),
              )
            ],
          )),
    );
  }
}
