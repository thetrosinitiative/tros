import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tros/utils/http/http_client.dart';

import '../models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  // FETCH USER
  Future<UserModel> getUser(String id) async {
    try {
      final user = await THttpHelper.get(
          'https://tros-api.onrender.com/api/v1', '/account/?_id=$id');
      debugPrint(user.toString());
      final userModel = UserModel(
          id: user['_id'],
          firstName: user['firstName'],
          lastName: user['lastName'],
          email: user['email'],
          phoneNumber: user['balance'],
          emailVerified: user['emailVerified']);
      return userModel;
    } catch (e) {
      return UserModel.empty();
    }
  }
}
