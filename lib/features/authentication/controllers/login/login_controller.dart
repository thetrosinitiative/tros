import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tros/common/loaders/loaders.dart';
// import 'package:tros/common/loaders/loaders.dart';
import 'package:tros/data/repositories/authentication_repository/authentication_repository.dart';
import 'package:tros/navigation_menu.dart';

import '../../../personalization/controllers/userController.dart';

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

  final userController = Get.put(UserController());

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
      final user = await AuthenticationRepository.instance.signin(details);
      debugPrint(user.toString());
      // debugPrint(user['accessToken']);

      // REMOVE LOADER
      isLoading.value = false;
      // GET UER DETAIL
      await userController.getUser(user);

      // REDIRECT TO HOME
      Get.to(() => const NavigationMenu());
      // AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      isLoading.value = false;
      debugPrint(e.toString());
      PLoaders.errorSnackBar(title: "Ooops!", message: e.toString());
      return;
    }
  }

  Future<void> forgottenPassword() async {}
}
