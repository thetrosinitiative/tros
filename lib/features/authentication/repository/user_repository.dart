import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tros/features/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  // SAVE USER DATA TO FIRESTORE
  Future<void> saveUser(UserModel user) async {
    try {} catch (e) {
      throw 'something went wrong, please try again';
    }
  }

  // FETCH USER DATA FROM FIRESTORE BASED ON ID
  // Future<UserModel> fetchUserData() async {
  //   try {

  //   } catch (e) {
  //     throw 'something went wrong, please try again';
  //   }
  // }

  // UPDATE USER DATA IN FIRESTORE
  Future<void> updateUserData(UserModel user) async {
    try {} catch (e) {
      throw 'something went wrong, please try again';
    }
  }

  // UPDATE FIELD IN USERS COLLECTION
  Future<void> updateSingleField(Map<String, dynamic> map) async {
    try {} catch (e) {
      throw 'something went wrong, please try again';
    }
  }

  // REMOVE USER DATA FROM FIRESTORE
  Future<void> removeUserData(String userId) async {
    try {} catch (e) {
      throw 'something went wrong, please try again';
    }
  }

  // UPLOADE USER PROFILE IMAGE
  // Future<String> uploadImage(String path, XFile image) async {
  //   try {

  //   } catch (e) {
  //     throw 'something went wrong, please try again';
  //   }
  // }

  // FETCH USER DATA FROM FIRESTORE
}
