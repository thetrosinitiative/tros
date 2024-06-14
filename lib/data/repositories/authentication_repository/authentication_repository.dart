import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tros/features/authentication/screens/login/login.dart';
import 'package:tros/features/authentication/screens/onboarding/onboarding.dart';
import 'package:tros/navigation_menu.dart';
import 'package:tros/utils/exceptions/auth_esception.dart';
import 'package:tros/utils/http/http_client.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // VARIABLES
  final deviceStorage = GetStorage();

  // CALLED FROM THE main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // FUNCTION TO SHOW REDIRECT SCREEN
  screenRedirect() async {
    if (kDebugMode) {
      print(
          '---------------------------- GET STORAGE AUTH REPO ----------------------------');
      print(deviceStorage.read('isFirstTime'));
    }
    // LOCAL STORAGE
    await deviceStorage.writeIfNull('isFirstTime', true);
    await deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }

  //  ------------------------------- Email and Password signin --------------------------

  // SIGNUP USER
  Future<String> signUp(Map<String, String> user) async {
    try {
      final result = await THttpHelper.post(
          'https://tros-api.onrender.com/api/v1', 'auth/signup', user);
      return result.toString();
    } on AuthException catch (e) {
      throw e.toString();
    }
  }

  // LOGIN WITH EMAIL AND PASSWORD
  Future<String> signin(Map<String, String> user) async {
    try {
      final result = await THttpHelper.post(
          'https://tros-api.onrender.com/api/v1', 'auth/login', user);
      return result.toString();
    } on AuthException catch (e) {
      throw e.toString();
    }
  }

  // REAUTHENTICATION
  // REGISTER EMAIL AUTHENTICATION
  // REAUTHENTICATION
  // EMAIL VERIFICATION
  Future<String> verifyEmail(Map<String, String> email) async {
    try {
      final result = await THttpHelper.post(
          'https://tros-api.onrender.com/api/v1', 'auth/email/verify', email);
      return result.toString();
    } on AuthException catch (e) {
      throw e.toString();
    }
  }

// VERIFY WITH PHONE NUMBER
  Future<String> verifyPhone(Map<String, String> phone) async {
    try {
      final result = await THttpHelper.post(
          'https://tros-api.onrender.com/api/v1', 'auth/phone/verify', phone);
      return result.toString();
    } on AuthException catch (e) {
      throw e.toString();
    }
  }

  // VERIFY PHONE NUMBER CODE
  Future<String> verifyPhoneNumberCode(Map<String, String> code) async {
    try {
      final result = await THttpHelper.post(
          'https://tros-api.onrender.com/api/v1',
          'auth/phone/verifyCode',
          code);
      return result.toString();
    } on AuthException catch (e) {
      throw e.toString();
    }
  }

  // FORGET PASSWORD
  Future<String> forgotPassword(Map<String, String> details) async {
    try {
      final result = await THttpHelper.post(
          'https://tros-api.onrender.com/api/v1',
          'auth/password/forgot',
          details);
      return result.toString();
    } on AuthException catch (e) {
      throw e.toString();
    }
  }

// VERIFY PASSWORD RESET CODE
  Future<String> verifyPasswordResetLink(Map<String, String> code) async {
    try {
      final result = await THttpHelper.post(
          'https://tros-api.onrender.com/api/v1',
          'auth/password/verifyCode',
          code);
      return result.toString();
    } on AuthException catch (e) {
      throw e.toString();
    }
  }

  // RESET TO NEW PASSWORD
  Future<String> resetPassword(Map<String, String> password) async {
    try {
      final result = await THttpHelper.post(
          'https://tros-api.onrender.com/api/v1', 'auth/signup', password);
      return result.toString();
    } on AuthException catch (e) {
      throw e.toString();
    }
  }
  //  ---------------------------------- FEDERATED IDENTITY AND SOCIAL SIGN IN---------------

  // GOOGLE AUTHENTICATION
  // FACEBOOK AUTHENTICATION

  //  ---------------------------------------OTHER VERIFICATION ---------------
  // LOGOUT USER
  // DELETE USER
}
