import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tros/features/authentication/screens/password_config/reset_password.dart';
import 'package:tros/utils/constants/sizes.dart';
import 'package:tros/utils/constants/text_strings.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(PSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADING
            Text(
              PTexts.forgetPassword,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: PSizes.spaceBtwItems,
            ),

            Text(
              PTexts.forgetPasswordSubtitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: PSizes.spaceBtwSections,
            ),
            const SizedBox(
              height: PSizes.spaceBtwSections * 2,
            ),
            // TEXTFIELD
            TextFormField(
              decoration: const InputDecoration(
                labelText: PTexts.email,
                prefixIcon: Icon(Iconsax.direct_bold),
              ),
            ),
            const SizedBox(
              height: PSizes.spaceBtwSections,
            ),
            // SUBMIT BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.off(() => const ResetPasswordScreen()),
                  child: const Text(PTexts.submit)),
            )
          ],
        ),
      ),
    );
  }
}
