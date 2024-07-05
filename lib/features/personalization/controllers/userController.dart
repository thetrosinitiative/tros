import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';
import '../repostories/user_repository.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userModel = UserModel.empty().obs;
  final profileLoading = false.obs;
  final userRepository = Get.put(UserRepository());

  Future<void> getUser(Map<String, dynamic> userDetail) async {
    try {
      profileLoading.value = true;
      final user = await userRepository.getUser(userDetail);
      debugPrint(user.toString());
      userModel(user);
      update();
    } catch (e) {
      userModel(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }
}
