import 'dart:async';

import 'package:get/get.dart';
import 'package:tros/common/loaders/loaders.dart';
import 'package:tros/common/widgets/success_screen/success_screen1.dart';
import 'package:tros/features/authentication/repository/authentication_repository.dart';
import 'package:tros/utils/constants/image_strings.dart';
import 'package:tros/utils/constants/text_strings.dart';

import '../../../personalization/controllers/userController.dart';

class EmailVerificationController extends GetxController {
  static EmailVerificationController get instance => Get.find();

// VARIABLES
  final userController = UserController.instance;
// SEND EMAIL VERIFICATION WHENEVER VERIFY SCREEN APPEARS AND SET TIMER FOR AUTO REDIRECT
  @override
  void onInit() {
    verifyUserEmail();
    autoRedirectTimer();
    super.onInit();
  }

// SEND EMAIL VERIFICATION LINK
  Future<void> verifyUserEmail() async {
    try {
      PLoaders.successSnackBar(
          title: 'Account created successfully',
          message:
              'Verification email has been sent to ${userController.userModel.value.email}');
    } catch (e) {
      PLoaders.errorSnackBar(title: 'Oops!', message: e.toString());
    }
  }

// TIMER TO AUTOMATE REDIRECT ON EMAIL VERIFICATION
  autoRedirectTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (userController.userModel.value.emailVerified) {
        timer.cancel();
        Get.off(() => SuccessScreen1(
            image: PImages.success,
            title: PTexts.accountCreatedTitle,
            subtitle: PTexts.accountCreatedSubtitle,
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }

// MANUALLY CHEK IF EMAIL IS VERIFIED
  checkEmailVerificationStatus() async {
    if (userController.userModel.value.emailVerified) {
      Get.off(() => SuccessScreen1(
          image: PImages.success,
          title: PTexts.accountCreatedTitle,
          subtitle: PTexts.accountCreatedSubtitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect()));
    }
  }
}
