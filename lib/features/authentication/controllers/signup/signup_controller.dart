import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tros/common/loaders/loaders.dart';
import 'package:tros/features/authentication/repository/authentication_repository.dart';
import 'package:tros/features/authentication/screens/signup/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

// VARIABLES
  final hidePassword = true.obs; //observable for hiding/showing passwords
  final privacyPolicy = false.obs; //observable for privacy policy
  final email = TextEditingController(); //email controller
  final lastName = TextEditingController(); //lastname controller
  final username = TextEditingController(); //username controller
  final firstName = TextEditingController(); //password controller
  final password = TextEditingController(); //password controller
  final phoneNumber = TextEditingController(); //phoneNumber controller
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  // final userRepository = Get.put(UserRepository());
  final isLoading = false.obs;
  //USER REPOSITORY

// SIGNUP
  Future<void> signup() async {
    try {
      // START LOADING
      isLoading.value = true;
      // CHECK INTERNET CONNECTIVITY
      // final isConnected = await NetworkManager.instance.isConnected();
      // if (!isConnected) {
      //   PFullScreenLoader.stopLoading();
      //   return;
      // }

      // FORM VALIDATION
      if (!signupFormKey.currentState!.validate()) {
        isLoading.value = false;

        return;
      }

      // PRIVACY POLICY CHECK
      if (!privacyPolicy.value) {
        PLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'To create an account, you must have to read and accept the Privacy Policy & Terms of Use');
        // PFullScreenLoader.stopLoading();
        isLoading.value = false;

        return;
      }
      final userInfo = <String, String>{
        'firstName': firstName.text.trim(),
        'lastName': lastName.text.trim(),
        'password': password.text.trim(),
        'email': email.text.trim(),
        'phoneNumber': phoneNumber.text.trim(),
      };
      // REGISTER USER
      final userCredential =
          await AuthenticationRepository.instance.signUp(userInfo);
      debugPrint(userCredential.toString());
      isLoading.value = false;

      // SHOW SUCCES MESSAGE
      PLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! verify email to continue');
      // MOVE TO VERIFY EMAIL ADDRESS
      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      isLoading.value = false;

      // SHOW GENERIC ERROR TO THE USER
      PLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return;
    }
  }

  @override
  void onClose() {
    email.dispose();
    lastName.dispose();
    username.dispose();
    firstName.dispose();
    password.dispose();
    phoneNumber.dispose();
    super.onClose();
  }
}
