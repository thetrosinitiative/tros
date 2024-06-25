import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tros/features/authentication/controllers/forgotten_password/forgotten_password_controller.dart';
import 'package:tros/features/authentication/screens/login/login.dart';
import 'package:tros/utils/constants/image_strings.dart';
import 'package:tros/utils/constants/sizes.dart';
import 'package:tros/utils/constants/text_strings.dart';
import 'package:tros/utils/helpers/helper_functions.dart';

import '../../../../common/styles/spacing_styles.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    final controller = ForgottenPasswordController.instance;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: controller.resetPasswordKey,
          child: Padding(
            padding: PSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HEADING
                const Center(
                  child: Image(
                    height: 170,
                    image: AssetImage(
                      PImages.appLogo,
                    ),
                  ),
                ),

                // RESET PASSWORD TITLE
                Text(
                  PTexts.resetPasswordTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(
                  height: PSizes.spaceBtwItems,
                ),
                // RESET PASSWORD SUBTITLE

                Text(
                  PTexts.resetPasswordSubtitle,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(
                  height: PSizes.spaceBtwSections,
                ),
                const SizedBox(
                  height: PSizes.spaceBtwSections,
                ),
                // TEXTFIELD
                Text(
                  'Enter a new password',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(
                  height: PSizes.spaceBtwItems / 4,
                ),
                TextFormField(
                  controller: controller.password1,
                  decoration: const InputDecoration(
                    hintText: PTexts.password,
                    // prefixIcon: Icon(Iconsax.direct_bold),
                  ),
                ),
                const SizedBox(
                  height: PSizes.spaceBtwItems,
                ),
                Text(
                  'Confirm password',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(
                  height: PSizes.spaceBtwItems / 4,
                ),
                TextFormField(
                  controller: controller.password2,
                  decoration: const InputDecoration(
                    hintText: 'Confirm ${PTexts.password}',
                    // prefixIcon: Icon(Iconsax.direct_bold),
                  ),
                ),
                const SizedBox(
                  height: PSizes.spaceBtwSections,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      child: ElevatedButton(
                          onPressed: () => controller.resetPassword(),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'CHANGE PASSWORD',
                            ),
                          )),
                    ),
                  ],
                ),
                // const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
