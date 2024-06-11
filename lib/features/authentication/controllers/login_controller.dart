import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tros/common/loaders/loaders.dart';
// import 'package:tros/common/loaders/loaders.dart';
import 'package:tros/data/repositories/authentication_repository/authentication_repository.dart';
import 'package:tros/navigation_menu.dart';

import '../../../../utils/constants/image_strings.dart';
// import '../../../../utils/helpers/network_manager.dart';
// import '../../../../utils/popups/fullscreen_loader.dart';
// import '../../../personalization/controllers/user_controller.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  // VARIABLE
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final isLoading = false.obs;

  // final userController = Get.put(UserController());

  @override
  void onInit() async {
    email.text = localStorage.read('remember_me_email');
    password.text = localStorage.read('remember_me_password');
    super.onInit();
  }

  Future<void> signin() async {
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
      if (!loginFormKey.currentState!.validate()) {
        isLoading.value = false;

        return;
      }
      // STORE REMEMBER ME
      if (rememberMe.value) {
        localStorage.writeIfNull('remember_me', true);
      }
      final details = <String, String>{
        'password': password.text.trim(),
        'email': email.text.trim(),
      };
      // LOGIN USER
      await AuthenticationRepository.instance.signin(details);

      // REMOVE LOADER
      isLoading.value = false;
      // REDIRECT TO HOME
      Get.to(() => const NavigationMenu());
      // AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      isLoading.value = false;
      PLoaders.errorSnackBar(title: "Ooops!", message: e.toString());
      return;
    }
  }

  Future<void> signInWithGoogle() async {
    // try {
    // // START LOADING
    // PFullScreenLoader.openLoadingDialog('Logging in.... ', PImages.loading);
    // // CHECK INTERNET CONNECTIVITY
    // final isConnected = await NetworkManager.instance.isConnected();
    // if (!isConnected) {
    //   PFullScreenLoader.stopLoading();
    //   return;
    //   }

    //   final userCredentials =
    //       await AuthenticationRepository.instance.signInWithGoogle();
    //   debugPrint(userCredentials.toString());
    //   await userController.saveUserRecord(userCredentials);
    //   // remove loader
    //   PFullScreenLoader.stopLoading();

    //   // SHOW SUCCES MESSAGE
    //   PLoaders.successSnackBar(title: 'Welcome back!');
    //   // MOVE TO VERIFY HOME SCREEN
    //   AuthenticationRepository.instance.screenRedirect();
    // } catch (e) {
    //   PFullScreenLoader.stopLoading();
    //   PLoaders.errorSnackBar(title: "Ooops!", message: e.toString());
    // }
  }
}
