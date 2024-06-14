// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'package:tros/features/main_app/models/banner_models.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  // VARIABLES

// GET ALL BANNERS
  Future<List<BannerModel>> getAllBanners() async {
    try {
      // final snapshot = await _db
      //     .collection('Banners')
      //     .where('active', isEqualTo: true)
      //     .get();
      // final list =
      //     snapshot.docs.map((doc) => BannerModel.fromSnapshot(doc)).toList();
      return [];
    } catch (e) {
      throw 'something went wrong, please try again';
    }
  }
// GET SUB CATEGORIES

// UPLOAD BANNERS TO THE CLOUD FIRESTORE
  Future<void> uploadDummeyData(List<BannerModel> banners) async {
    try {
      // // UPLOAD ALL CATEGORIES ALONG WITH THEIR IMAGES
      // final storage = Get.put(PFirebaseStorageServices());
      // // LOOP THROUGH EACH CATEGORY
      // for (var banner in banners) {
      //   // GET IMAGEDATA LINK FROM THE LOCAL ASSETS;
      //   final file = await storage.getImageDataFromAssets(banner.imageUrl);

      //   // upload image and get its url
      //   final url =
      //       await storage.uploadImageData('Banners', file, banner.imageUrl);
      //   // Assign url to banner.image attribute
      //   banner.imageUrl = url;

      //   // STORE banner IN FIRESTORE
      //   await _db.collection('Banners').doc().set(banner.toMap());
      // }
    } catch (e) {
      throw 'something went wrong, please try again';
    }
  }
}
