import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tros/features/authentication/screens/login/login.dart';
import 'package:tros/features/authentication/screens/onboarding/onboarding.dart';
import 'package:tros/features/personalization/controllers/userController.dart';
import 'package:tros/features/personalization/models/user_model.dart';
import 'package:tros/navigation_menu.dart';
import 'package:tros/utils/exceptions/auth_esception.dart';
import 'package:tros/utils/http/http_client.dart';
import 'package:tros/utils/local_storage/storage_utility.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // VARIABLES
  final deviceStorage = GetStorage();
  final user = Get.put(UserController());

  // CALLED FROM THE main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // FUNCTION TO SHOW REDIRECT SCREEN
  screenRedirect() async {
    // if (kDebugMode) {
    //   print(
    //       '---------------------------- GET STORAGE AUTH REPO ----------------------------');
    //   print(deviceStorage.read('isFirstTime'));
    // }
    // LOCAL STORAGE

    // if (user.userModel.value != UserModel.empty()) {
    //   await PLocalStorage.init(user.userModel.value.id);
    // }
    await deviceStorage.writeIfNull('isFirstTime', true);
    await deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        // await deviceStorage.read('remember_me') != true
        //     ? Get.offAll(() => const LoginScreen())
        //     : signInFaster()
        : Get.offAll(() => const OnBoardingScreen());
  }

  Future<void> signInFaster() async {
    final email = deviceStorage.read('remember_me_email');
    final password = deviceStorage.read('remember_me_password');
    final details = <String, String>{
      'password': password.trim(),
      'email': email.trim(),
    };
    debugPrint(details.toString());
    // LOGIN USER
    final userr = await signin(details);

    await user.getUser(userr);

    // REDIRECT TO HOME
    Get.offAll(() => const NavigationMenu());
  }

  //  ------------------------------- Email and Password signin --------------------------

  // SIGNUP USER
  Future<Map<String, dynamic>> signUp(Map<String, String> user) async {
    try {
      Map<String, dynamic> result = await THttpHelper.post(
          baseUrl: 'https://tros-api.onrender.com/api/v1',
          endpoint: 'auth/signup',
          data: user);
      debugPrint(result.toString());
      return result;
    } on CustomException catch (e) {
      throw e.toString();
    }
  }

  // LOGIN WITH EMAIL AND PASSWORD
  Future<Map<String, dynamic>> signin(Map<String, String> user) async {
    try {
      Map<String, dynamic> result = await THttpHelper.post(
          baseUrl: 'https://tros-api.onrender.com/api/v1',
          endpoint: 'auth/login',
          data: user);
      return result;
    } on CustomException catch (e) {
      throw e.toString();
    }
  }

  // REAUTHENTICATION
  // REGISTER EMAIL AUTHENTICATION
  // REAUTHENTICATION
  // EMAIL VERIFICATION
  Future<Map<String, dynamic>> verifyEmail(Map<String, String> email) async {
    try {
      final result = await THttpHelper.post(
          baseUrl: 'https://tros-api.onrender.com/api/v1',
          endpoint: 'auth/email/verify',
          data: email);
      return result;
    } on CustomException catch (e) {
      throw e.toString();
    }
  }

// VERIFY WITH PHONE NUMBER
  Future<Map<String, dynamic>> verifyPhone(Map<String, String> phone) async {
    try {
      final result = await THttpHelper.post(
          baseUrl: 'https://tros-api.onrender.com/api/v1',
          endpoint: 'auth/phone/verify',
          data: phone);
      return result;
    } on CustomException catch (e) {
      throw e.toString();
    }
  }

  // VERIFY PHONE NUMBER CODE
  Future<Map<String, dynamic>> verifyPhoneNumberCode(
      Map<String, String> code) async {
    try {
      final result = await THttpHelper.post(
          baseUrl: 'https://tros-api.onrender.com/api/v1',
          endpoint: 'auth/phone/verifyCode',
          data: code);
      return result;
    } on CustomException catch (e) {
      throw e.toString();
    }
  }

  // FORGET PASSWORD
  Future<void> forgotPassword(Map<String, String> details) async {
    try {
      await THttpHelper.post(
          baseUrl: 'https://tros-api.onrender.com/api/v1',
          endpoint: 'auth/password/forgot',
          data: details);
    } on CustomException catch (e) {
      throw e.toString();
    }
  }

// VERIFY PASSWORD RESET CODE
  Future<Map<String, dynamic>> verifyPasswordResetLink(
      Map<String, String> code) async {
    try {
      final result = await THttpHelper.post(
          baseUrl: 'https://tros-api.onrender.com/api/v1',
          endpoint: 'auth/password/verifyCode',
          data: code);
      return result;
    } on CustomException catch (e) {
      throw e.toString();
    }
  }

  // RESET TO NEW PASSWORD
  Future<void> resetPassword(Map<String, String> password, String url) async {
    try {
      await THttpHelper.patch(baseUrl: url, data: password);
    } on CustomException catch (e) {
      throw e.toString();
    }
  }
  //  ---------------------------------- FEDERATED IDENTITY AND SOCIAL SIGN IN---------------

  // GOOGLE AUTHENTICATION
  // FACEBOOK AUTHENTICATION

  //  ---------------------------------------OTHER VERIFICATION ---------------
  // LOGOUT USER
  void signOut() async {
    user.userModel.value = UserModel.empty();
    await deviceStorage.write('remember_me', false);
    // await deviceStorage.write('user', {});
    Get.offAll(() => const LoginScreen());
  }
  // DELETE USER
}
