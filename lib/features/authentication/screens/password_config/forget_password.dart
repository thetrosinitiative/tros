import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tros/features/authentication/screens/password_config/reset_password.dart';
import 'package:tros/utils/constants/colors.dart';
import 'package:tros/utils/constants/image_strings.dart';
import 'package:tros/utils/constants/sizes.dart';
import 'package:tros/utils/constants/text_strings.dart';
import 'package:tros/utils/helpers/helper_functions.dart';

import '../../../../common/styles/spacing_styles.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return Scaffold(
      // appBar: AppBar(),
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
              Text(
                PTexts.forgetPasswordTitle,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .apply(color: PColors.primary),
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
                height: PSizes.spaceBtwSections,
              ),
              // TEXTFIELD
              Text(
                'Email',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: PSizes.spaceBtwItems,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: PTexts.email,
                  // prefixIcon: Icon(Iconsax.direct_bold),
                ),
              ),
              const SizedBox(
                height: PSizes.spaceBtwSections * 9,
              ),
              // SUBMIT BUTTON
              // SizedBox.expand(
              //   child: const Spacer(
              //     flex: 2,
              //   ),
              // ),
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
                                color:
                                    isDark ? PColors.dark : PColors.darkGrey))),
                  ),
                  SizedBox(
                    child: ElevatedButton(
                        onPressed: () =>
                            Get.off(() => const ResetPasswordScreen()),
                        child: const Text(PTexts.next)),
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
