import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tros/features/authentication/controllers/forgotten_password/forgotten_password_controller.dart';
import 'package:tros/features/authentication/screens/password_config/change_password.dart';
import 'package:tros/utils/constants/colors.dart';
import 'package:tros/utils/constants/image_strings.dart';
import 'package:tros/utils/constants/sizes.dart';
import 'package:tros/utils/constants/text_strings.dart';
import 'package:tros/utils/helpers/helper_functions.dart';

import '../../../../common/styles/spacing_styles.dart';

class VerifyResetCodeScreen extends StatelessWidget {
  const VerifyResetCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    final controller = ForgottenPasswordController.instance;
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: controller.verifyResetKey,
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

                // VERIFY CODE TITLE
                Text(
                  PTexts.resetCodeTitle,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .apply(color: PColors.primary),
                ),
                const SizedBox(
                  height: PSizes.spaceBtwItems,
                ),
                // VERIFY CODE SUBTITLE
                Text(
                  PTexts.resetCodeSubtitle,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(
                  height: PSizes.spaceBtwItems,
                ),
                const SizedBox(
                  height: PSizes.spaceBtwSections,
                ),
                // TEXTFIELD
                Text(
                  'Enter code',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(
                  height: PSizes.spaceBtwItems / 4,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller.verifyResetCode,
                  decoration: const InputDecoration(
                      hintText: 'E.g. 123456',
                      hintStyle:
                          TextStyle(color: PColors.darkGrey, fontSize: 14)
                      // prefixIcon: Icon(Iconsax.direct_bold),
                      ),
                ),
                const SizedBox(
                  height: PSizes.spaceBtwSections * 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                isDark ? PColors.primary : PColors.grey,
                          ),
                          onPressed: () => Get.back(),
                          child: Text(PTexts.back,
                              style: TextStyle(
                                  color: isDark
                                      ? PColors.dark
                                      : PColors.darkGrey))),
                    ),
                    SizedBox(
                      child: ElevatedButton(
                          onPressed: () =>
                              controller.sendForgottenPasswordCode(),
                          child: const Text(PTexts.next)),
                    ),
                    // const Spacer(),
                  ],
                ),
              ]),
        ),
      ),
    ));
  }
}
