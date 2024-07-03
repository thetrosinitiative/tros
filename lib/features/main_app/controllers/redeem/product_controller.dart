import 'package:get/get.dart';

import '../../../../common/loaders/loaders.dart';
import '../../models/redeem/redeem_model.dart';
import '../../repositories/redeem/product_repository.dart';

class AllProductController extends GetxController {
  static AllProductController get instance => Get.find();

  final repository = ProductRepository.instance;
  final Rx<String> selectedSortOption = 'Name'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductQuery() async {
    try {
      final products = await repository.getAllProducts();
      return products;
    } catch (e) {
      PLoaders.errorSnackBar(title: 'Ohps!', message: e.toString());
      return [];
    }
  }

//   void assignProducts(List<ProductModel> products) {
// // Assign products to the 'products list
//     this.products.assignAll(products);
//     sortProducts('Name');
//   }
}
