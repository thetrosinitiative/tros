// 0804 	Mtel

//  (formerly Visafone[3])
//  (formerly ZoomMobile)
// 07027 	Multi-Links
// 0709 	Multi-Links
// 07020 	Smile
// 07028 	Starcomms
// 07029 	Starcomms
// 0819 	Starcomms

import 'package:get/get.dart';
import 'package:tros/features/personalization/controllers/userController.dart';
import 'package:tros/utils/constants/image_strings.dart';

class PhoneNumberType extends GetxController {
  static PhoneNumberType get instance => Get.find();
  final initialValue = UserController.instance.userModel.value.phoneNumber.obs;

  final typeImage = ''.obs;
  Map<String, List<int>> numberData = {
    'Airtel': [
      0701,
      0708,
      0802,
      0808,
      0812,
      0901,
      0902,
      0904,
      0907,
      0912,
      0911
    ],
    'MTN': [
      0703,
      0706,
      0803,
      0806,
      0810,
      0813,
      0814,
      0816,
      0903,
      0906,
      0913,
      0916,
      07025,
      07026,
      0704,
      0707,
    ],
    'GLO': [
      0705,
      0805,
      0807,
      0811,
      0815,
      0905,
      0915,
    ],
    '9MOBILE': [0809, 0817, 0818, 0909, 0908],
    'STARCOMMS': [],
    'MULTI-LINKS': [],
    'MTEL': [],
  };
  Map<String, String> networkImageType = {
    'Airtel': PImages.airtel,
    'MTN': PImages.mtn,
    'GLO': PImages.glo,
    '9MOBILE': PImages.mobile,
    // 'STARCOMMS': 'images/starcomms.png',
    // 'MULTI-LINKS': 'images/multilinks.png',
    // 'MTEL': 'images/mtel.png',
  };
  // Get all all numbers by their network type
  List<int> getNumbersByType(String type) {
    return numberData[type] ?? [];
  }

// get all available network types
  List<String> getTypes() {
    return numberData.keys.toList();
  }

// get the network by the number
  String getNumberType(int number) {
    for (var key in numberData.keys) {
      if (numberData[key]!.contains(number)) {
        typeImage.value = networkImageType[key]!;
        typeImage.refresh();
        return key;
      }
    }
    typeImage.value = '';
    typeImage.refresh();
    return '';
  }

  // get the image of a network
  String getNetworkImage(String type) {
    return networkImageType[type] ?? '';
  }

  void changeInitialValue(String value) {
    if (value.isEmpty) {
      initialValue.value = UserController.instance.userModel.value.phoneNumber;
    }
    initialValue.value = value;
  }
}
