import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tros/features/authentication/controllers/login/login_controller.dart';
import 'package:tros/features/authentication/screens/password_config/forget_password.dart';
import 'package:tros/features/authentication/screens/signup/signup.dart';
import 'package:tros/utils/constants/colors.dart';
import 'package:tros/utils/validators/validation.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

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
              controller: controller.email,
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
                controller: controller.password,
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
              height: PSizes.spaceBtwInputFields / 3,
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
                  child: Text(
                    PTexts.forgetPassword,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .apply(color: PColors.primary),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: PSizes.spaceBtwItems / 2.5,
            ),
            // SignInButton
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: ElevatedButton(
                  onPressed: () => controller.signin(),
                  child: //
                      Obx(() {
                    return controller.isLoading.value
                        ? LoadingAnimationWidget.staggeredDotsWave(
                            color: PColors.white, size: 50)
                        : const Text(PTexts.signIn);
                  }),
                ),
              ),
            ),
            const SizedBox(
              height: PSizes.spaceBtwItems / 2.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${PTexts.noAccount} ',
                    style: Theme.of(context).textTheme.bodySmall),
                GestureDetector(
                  onTap: () => Get.to(() => const SignupScreen()),
                  child: Text('Sign-up ',
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                          color: PColors.primary,
                          decorationColor: PColors.primary,
                          decoration: TextDecoration.underline)),
                ),
              ],
            ),

            // const SizedBox(height: PSizes.spaceBtwItems),
            // create account buttons
          ],
        ),
      ),
    );
  }
}
