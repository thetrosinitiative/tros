import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tros/features/authentication/controllers/login_controller.dart';
import 'package:tros/features/authentication/screens/password_config/forget_password.dart';
import 'package:tros/navigation_menu.dart';
import 'package:tros/utils/validators/validation.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../signup/signup.dart';

class PLoginForm extends StatelessWidget {
  const PLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: PSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              validator: TValidator.validateEmail,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right_outline),
                  labelText: PTexts.email),
            ),
            const SizedBox(
              height: PSizes.spaceBtwInputFields,
            ),

            //Password
            Obx(() {
              return TextFormField(
                obscureText: controller.hidePassword.value,
                validator: (value) =>
                    TValidator.validateEmptyText('Password', value),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check_outline),
                  labelText: PTexts.password,
                  suffixIcon: IconButton(
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash_outline
                        : Iconsax.eye_bold),
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                  ),
                ),
              );
            }),
            const SizedBox(
              height: PSizes.spaceBtwInputFields / 2,
            ),
            // Remeber me and forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remeber me
                Row(
                  children: [
                    Obx(() => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value)),
                    const Text(PTexts.remember)
                  ],
                ),
                // forget password
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPasswordScreen()),
                  child: const Text(PTexts.forgetPassword),
                )
              ],
            ),
            const SizedBox(
              height: PSizes.spaceBtwSections,
            ),
            // SignInButton
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(const NavigationMenu()),
                child: const Text(PTexts.signIn),
              ),
            ),

            const SizedBox(height: PSizes.spaceBtwItems),
            // create account buttons
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(PTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
