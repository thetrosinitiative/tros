import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();
  final email = TextEditingController(); //email controller
  final lastName = TextEditingController(); //lastname controller
  final phoneNumber = TextEditingController(); //phoneNumber controller
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
}
