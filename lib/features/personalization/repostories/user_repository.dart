import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tros/utils/http/http_client.dart';

import '../models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  // FETCH USER
  Future<UserModel> getUser(Map<String, dynamic> userDetail) async {
    try {
      final user = await THttpHelper.get(
          userDetail['userId'], 'https://tros-api.onrender.com/api/v1/account',
          accessToken: userDetail["accessToken"]);
      debugPrint(user.toString());
      final userModel = UserModel(
        id: user['_id'],
        firstName: user['firstName'],
        lastName: user['lastName'],
        email: user['email'],
        phoneNumber: user['balance'],
        emailVerified: user['emailVerified'],
        phoneVerified: user['phoneVerified'],
        balance: user['balance'],
      );
      return userModel;
    } catch (e) {
      return UserModel.empty();
    }
  }
}
