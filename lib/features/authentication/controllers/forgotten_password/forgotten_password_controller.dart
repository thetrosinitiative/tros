import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tros/data/repositories/authentication_repository/authentication_repository.dart';
import 'package:tros/features/authentication/screens/login/login.dart';

import '../../../../common/loaders/loaders.dart';
import '../../screens/password_config/verify_reset_code.dart';
import '../../screens/password_config/change_password.dart';

class ForgottenPasswordController extends GetxController {
  static ForgottenPasswordController get instance => Get.find();

  final isLoading = false.obs;
  final email = TextEditingController();
  final verifyResetCode = TextEditingController();
  final password1 = TextEditingController();
  final password2 = TextEditingController();

  GlobalKey<FormState> forgotPasswordKey = GlobalKey<FormState>();
  GlobalKey<FormState> resetPasswordKey = GlobalKey<FormState>();

  GlobalKey<FormState> verifyResetKey = GlobalKey<FormState>();

  final resetPasswordUrl = ''.obs;

  Future<void> sendForgottenPasswordCode() async {
    try {
      isLoading.value = true;
      // START LOADING
      // PFullScreenLoader.openLoadingDialog('Logging in.... ', PImages.loading);
      // CHECK INTERNET CONNECTIVITY
      // final isConnected = await NetworkManager.instance.isConnected();
      // if (!isConnected) {
      //   PFullScreenLoader.stopLoading();
      //   return;
      // }

      // FORM VALIDATION
      if (!verifyResetKey.currentState!.validate()) {
        isLoading.value = false;

        return;
      }

      final details = <String, String>{
        // 'password': password.text.trim(),
        'code': verifyResetCode.text.trim(),
      };

      final response = await AuthenticationRepository.instance
          .verifyPasswordResetLink(details);
      resetPasswordUrl(response['passwordResetURL']);

      Get.to(() => const ChangePasswordScreen());
    } catch (e) {
      isLoading.value = false;
      PLoaders.errorSnackBar(title: "Ooops!", message: e.toString());
      return;
    }
  }

  Future<void> sendForgottenPasswordRequest() async {
    try {
      isLoading.value = true;
      // START LOADING
      // PFullScreenLoader.openLoadingDialog('Logging in.... ', PImages.loading);
      // CHECK INTERNET CONNECTIVITY
      // final isConnected = await NetworkManager.instance.isConnected();
      // if (!isConnected) {
      //   PFullScreenLoader.stopLoading();
      //   return;
      // }

      // FORM VALIDATION
      if (!forgotPasswordKey.currentState!.validate()) {
        isLoading.value = false;

        return;
      }

      final details = <String, String>{
        // 'password': password.text.trim(),
        'email': email.text.trim(),
      };

      await AuthenticationRepository.instance.forgotPassword(details);

      Get.to(() => const VerifyResetCodeScreen());
    } catch (e) {
      isLoading.value = false;
      PLoaders.errorSnackBar(title: "Ooops!", message: e.toString());
      return;
    }
  }

  Future<void> resetPassword() async {
    try {
      isLoading.value = true;
      // START LOADING
      // PFullScreenLoader.openLoadingDialog('Logging in.... ', PImages.loading);
      // CHECK INTERNET CONNECTIVITY
      // final isConnected = await NetworkManager.instance.isConnected();
      // if (!isConnected) {
      //   PFullScreenLoader.stopLoading();
      //   return;
      // }
      debugPrint('Proceeding');

      // FORM VALIDATION
      if (!resetPasswordKey.currentState!.validate()) {
        isLoading.value = false;

        return;
      }
      debugPrint('Proceeding');

      // if (password1.text.trim != password2.text.trim) return;
      debugPrint('Proceeding');

      final details = <String, String>{
        'password': password2.text.trim(),
      };
      debugPrint(resetPasswordUrl.value);
      await AuthenticationRepository.instance
          .resetPassword(details, resetPasswordUrl.value);

      // SHOW SUCCES MESSAGE
      PLoaders.successSnackBar(
          title: "You're all set",
          message:
              'You have successfully changed your password. proceed to login');

      Get.offAll(() => const LoginScreen());
    } catch (e) {
      isLoading.value = false;
      debugPrint(e.toString());
      PLoaders.errorSnackBar(title: "Ooops!", message: e.toString());
      return;
    }
  }
}
