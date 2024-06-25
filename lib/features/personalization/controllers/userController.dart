import 'package:get/get.dart';

import '../models/user_model.dart';
import '../repostories/user_repository.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userModel = UserModel.empty().obs;
  final profileLoading = false.obs;
  final userRepository = Get.put(UserRepository());
 
  Future<void> getUser(String id) async {
    try {
      profileLoading.value = true;
      final user = await userRepository.getUser(id);
      userModel(user);
    } catch (e) {
      userModel(UserModel.empty());
    }
    finally{
      profileLoading.value = false;
    }
  }
}
