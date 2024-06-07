import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tros/features/authentication/screens/login/login.dart';
import 'package:tros/features/authentication/screens/password_config/reset_password.dart';
import 'package:tros/utils/constants/colors.dart';
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

    return Scaffold(
      body: SingleChildScrollView(
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
                decoration: const InputDecoration(
                  labelText: PTexts.email,
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
                decoration: const InputDecoration(
                  labelText: PTexts.email,
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
                        onPressed: () => Get.offAll(const LoginScreen()),
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
    );
  }
}
