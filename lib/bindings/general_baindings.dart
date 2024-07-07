import 'package:get/get.dart';
import 'package:tros/features/redeem/controllers/redeem/cart_controller.dart';
import 'package:tros/services/location/location_service.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
    Get.put(TGeolocator());
  }
}
