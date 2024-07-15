import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tros/utils/http/http_client.dart';

import '../../../../utils/exceptions/auth_esception.dart';
// import '../../models/redeem/product_model.dart';
import '../../models/redeem/redeem_model.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  // VARIABLES

  final baseUrl = 'https://tros-api.onrender.com/api/v1';

// GET ALL PRODUCTS
  Future<List<ProductModel>> getAllProducts() async {
    try {
      List products = await THttpHelper.get('resources/products', baseUrl);
      List<ProductModel> productList = [];

      // ignore: avoid_function_literals_in_foreach_calls
      productList.assignAll(
          products.map((product) => ProductModel.fromMap(product)).toList());
      debugPrint(productList.toString());
      return productList;
    } on CustomException catch (e) {
      throw e.toString();
    } catch (e) {
      rethrow;
    }
  }

  // GET ALL PRODUCTS BY BRAND
  // Future<List<ProductModel>> getProductsByBrand(
  //     {required String brandId, int limit = -1}) async {
  //   try {
  //     final snapshot = limit == -1
  //         ? await _db
  //             .collection('Products')
  //             .where('brand.id', isEqualTo: brandId)
  //             .get()
  //         : await _db
  //             .collection('Products')
  //             .where('brand.id', isEqualTo: brandId)
  //             .limit(limit)
  //             .get();

  //     return [];
  //   } catch (e) {
  //     throw 'something went wrong, please try again';
  //   }
  // }

  // / GET LIMITED FEATURED PRODUCTS
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      return [];
    } catch (e) {
      throw 'something went wrong, please try again';
    }
  }

// / / GET ALL FEATURED PRODUCTS
  // Future<List<ProductModel>> getAllFeaturedProducts() async {
  //   try {
  //     final snapshot = await _db
  //         .collection('Products')
  //         .where('isFeatured', isEqualTo: true)
  //         .get();

  //     return [];
  //   } catch (e) {
  //     throw 'something went wrong, please try again';
  //   }
  // }

// GET LIMITED FEATURED PRODUCTS
  // Future<List<ProductModel>> getRecommendedProducts() async {
  //   try {
  //     final snapshot = await _db
  //         .collection('Products')
  //         .where('isFeatured', isEqualTo: false)
  //         .limit(4)
  //         .get();

  //     return [];
  //   } catch (e) {
  //     throw 'something went wrong, please try again';
  //   }
  // }

  // / / GET ALL RECOMMENDED PRODUCTS
  // Future<List<ProductModel>> getAllRecommendedProducts() async {

  // }

  // / GET PRODUCTS BY BRAND
  // Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
  //   try {

  // }

  // GET ALL PRODUCTS
  // Future<List<ProductModel>> getFavoriteProducts(List<String> productId) async {

  // }
// GET SUB Products

// UPLOAD Products TO THE CLOUD FIRESTORE
  // Future<void> uploadDummeyData(List<ProductModel> products) async {

  // }
}
