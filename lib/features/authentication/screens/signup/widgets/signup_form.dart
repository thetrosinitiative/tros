import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tros/features/authentication/controllers/signup/signup_controller.dart';
import 'package:tros/utils/constants/colors.dart';
import 'package:tros/utils/validators/validation.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import 'terms_and_conditions_checkbox.dart';

class PSignupForm extends StatelessWidget {
  const PSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    final controller = Get.put(SignupController());

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          // first and last name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      TValidator.validateEmptyText('Firstname', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: PTexts.firstname,
                      prefixIcon: Icon(Iconsax.user_outline)),
                ),
              ),
              const SizedBox(
                width: PSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      TValidator.validateEmptyText('Lastname', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: PTexts.lastname,
                      prefixIcon: Icon(Iconsax.user_outline)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: PSizes.spaceBtwInputFields,
          ),

          TextFormField(
            controller: controller.email,
            expands: false,
            validator: TValidator.validateEmail,
            decoration: const InputDecoration(
                labelText: PTexts.email,
                prefixIcon: Icon(Iconsax.direct_outline)),
          ),
          const SizedBox(
            height: PSizes.spaceBtwInputFields,
          ),
          // PhoneNumber
          TextFormField(
            controller: controller.phoneNumber,
            expands: false,
            validator: TValidator.validatePhoneNumber,
            decoration: const InputDecoration(
                labelText: PTexts.phoneNumber,
                prefixIcon: Icon(Iconsax.call_outline)),
          ),
          const SizedBox(
            height: PSizes.spaceBtwInputFields,
          ),
          // Password

          Obx(() {
            return TextFormField(
              obscureText: controller.hidePassword.value,
              controller: controller.password,
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
            height: PSizes.spaceBtwSections,
          ),
          // Terms and condition
          const PTermsAndConditions(),
          const SizedBox(
            height: PSizes.spaceBtwSections,
          ),
          // SignUp Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: //
                  Obx(() {
                return controller.isLoading.value
                    ? LoadingAnimationWidget.staggeredDotsWave(
                        color: PColors.white, size: 50)
                    : const Text(PTexts.createAccount);
              }),
              onPressed: () => controller.signup(),
            ),
          )
        ],
      ),
    );
  }
}
