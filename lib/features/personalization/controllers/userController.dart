import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tros/utils/local_storage/storage_utility.dart';

import '../models/user_model.dart';
import '../repostories/user_repository.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final hideBalance = true.obs;
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
      await PLocalStorage.init(userModel.value.id);

      loadBalance();
    } catch (e) {
      userModel(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  void saveBalance(int balance) async {
    debugPrint(balance.toString());

    await PLocalStorage.instance().saveData('balance', balance);
  }

  void loadBalance() async {
    final balance = PLocalStorage.instance().readData<int>('balance');
    debugPrint(balance.toString());
    if (balance != null) {
      userModel.value.balance = balance.toDouble();
      update();
    } else {
      return;
    }
  }
}
