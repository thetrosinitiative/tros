import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tros/common/widgets/appbar/appBar.dart';
import 'package:tros/common/widgets/images/circular_images.dart';
import 'package:tros/common/widgets/texts/section_heading.dart';
// import 'package:tros/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:tros/utils/constants/image_strings.dart';
import 'package:tros/utils/constants/sizes.dart';

import '../../controllers/userController.dart';
import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: const PAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(PSizes.defaultSpace),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                // PROFILE PICTURE
                // final networkImage = controller.userModel.value.profilePicture;
                // final image =
                //     networkImage.isNotEmpty ? networkImage : PImages.appLogo;
                // return controller.imageUploading.value
                //     ? const ShimmerEffect(
                //         height: 80,
                //         width: 80,
                //         radius: 80,
                //       )
                //     :
                const PCircularImage(
                  // isNetworkImage: networkImage.isNotEmpty,
                  imageUrl: PImages.appLogo,
                  width: 88,
                  height: 88,
                ),

                TextButton(
                  onPressed: () {},
                  child: const Text('Change Profile Pics'),
                ),

                // PROFILE INFO HEADING
                const SizedBox(
                  height: PSizes.spaceBtwItems / 2,
                ),
                const Divider(),
                const SizedBox(
                  height: PSizes.spaceBtwItems,
                ),
                const PSectionHeading(
                  title: 'Profile Information',
                  showActionButton: false,
                ),
                const SizedBox(
                  height: PSizes.spaceBtwSections,
                ),

                PProfileMenu(
                    onPressed: () {},
                    title: 'Name',
                    value: controller.userModel.value.fullName),

                // PERSONAL INFO HEADING

                const SizedBox(
                  height: PSizes.spaceBtwItems / 2,
                ),
                const Divider(),
                const SizedBox(
                  height: PSizes.spaceBtwItems,
                ),
                const PSectionHeading(
                  title: 'Personal Information',
                  showActionButton: false,
                ),
                const SizedBox(
                  height: PSizes.spaceBtwSections,
                ),
                PProfileMenu(
                  icon: Iconsax.copy_outline,
                  onPressed: () {},
                  title: 'User ID',
                  value: controller.userModel.value.id,
                ),
                PProfileMenu(
                    onPressed: () {},
                    title: 'E-Mail',
                    value: controller.userModel.value.email),
                PProfileMenu(
                    onPressed: () {},
                    title: 'Phone Number',
                    value: controller.userModel.value.phoneNumber),
                PProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
                PProfileMenu(
                    onPressed: () {},
                    title: 'Date Of Birth',
                    value: '30 May, 2000'),
                const Divider(),
                const SizedBox(
                  height: PSizes.spaceBtwSections,
                ),
                Center(
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Delete Account',
                        style: TextStyle(color: Colors.red),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
