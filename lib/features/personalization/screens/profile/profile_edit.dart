import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tros/common/widgets/appbar/boldAppbar.dart';
import 'package:tros/common/widgets/images/circular_images.dart';
import 'package:tros/utils/constants/colors.dart';
import 'package:tros/utils/constants/image_strings.dart';
import 'package:tros/utils/constants/sizes.dart';
import 'package:tros/utils/constants/text_strings.dart';

import '../../../../utils/validators/validation.dart';
import '../../controllers/profileController.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
      appBar: const BoldAppbar(
        useAction: false,
        text: 'Edit Profile',
        implyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.spaceBtwSections),
          child: Column(
            children: [
              const SizedBox(
                width: PSizes.spaceBtwSections * 4,
              ),
              //Profile Pics
              const PCircularImage(
                imageUrl: PImages.profile,
                height: 70,
                width: 70,
                backgroundColor: PColors.containerGrey,
              ),
              const SizedBox(height: PSizes.spaceBtwSections),
              // Form
              Form(
                // key: controller.signupFormKey,
                child: Column(
                  children: [
                    // first and last name
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            // controller: controller.firstName,
                            validator: (value) => TValidator.validateEmptyText(
                                'Firstname', value),
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
                            // controller: controller.lastName,
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
                    // Text(
                    //   'Email',
                    //   style: Theme.of(context).textTheme.labelMedium,
                    // ),
                    // const SizedBox(
                    //   height: PSizes.spaceBtwItems,
                    // ),
                    TextFormField(
                      // controller: controller.email,
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
                      // controller: controller.phoneNumber,
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

                    const SizedBox(
                      height: PSizes.spaceBtwSections,
                    ),
                    // Terms and condition
                    const SizedBox(
                      height: PSizes.spaceBtwSections,
                    ),
                    // SignUp Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: //
                            //   Obx(() {
                            // return true
                            //     ? LoadingAnimationWidget.staggeredDotsWave(
                            //         color: PColors.white, size: 50)
                            const Text('Save Changes'),
                        // }),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),

              // Divider

              const SizedBox(
                height: PSizes.spaceBtwSections,
              ),
              // Footer
            ],
          ),
        ),
      ),
    );
  }
}
