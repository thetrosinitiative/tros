import 'package:get/get.dart';
import 'package:tros/features/redeem/controllers/redeem/cart_controller.dart';
import 'package:tros/services/location/location_service.dart';
import 'package:tros/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put(TGeolocator());
    Get.put(NetworkManager());
  }
}
