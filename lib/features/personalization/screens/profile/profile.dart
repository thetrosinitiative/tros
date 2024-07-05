import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tros/common/builders/listdividerseperated.dart';
import 'package:tros/common/styles/spacing_styles.dart';
import 'package:tros/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tros/features/personalization/controllers/userController.dart';
import 'package:tros/utils/constants/colors.dart';
import 'package:tros/utils/constants/image_strings.dart';
import 'package:tros/utils/constants/sizes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: PSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: PSizes.spaceBtwSections,
              ),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(PImages.appLogo),
              ),
              const SizedBox(
                height: PSizes.spaceBtwItems,
              ),

              Obx(() {
                return Text(
                  "${userController.userModel.value.firstName} ${userController.userModel.value.lastName}",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .apply(fontSizeDelta: -2, fontWeightDelta: 1),
                );
              }),
              const SizedBox(
                height: PSizes.spaceBtwItems / 2,
              ),
              Obx(() {
                return Text(
                  userController.userModel.value.email,
                  style: Theme.of(context).textTheme.titleMedium,
                );
              }),
              const SizedBox(
                height: PSizes.spaceBtwItems,
              ),
              // INFO CARD
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TRoundedContainer(
                    borderColor: PColors.primary,
                    backgroundColor: PColors.containerGrey,
                    padding: const EdgeInsets.all(8),
                    width: 150,
                    height: 90,
                    showBorder: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.supervised_user_circle_rounded),
                        const Text('Your plan'),
                        Text(
                          'Plastic Recycling journey',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium!.apply(
                                fontSizeDelta: -3,
                              ),
                        )
                      ],
                    ),
                  ),
                  TRoundedContainer(
                    borderColor: PColors.primary,
                    backgroundColor: PColors.containerGrey,
                    padding: const EdgeInsets.all(8),
                    width: 150,
                    height: 90,
                    showBorder: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Iconsax.people_bold),
                        const SizedBox(
                          height: PSizes.spaceBtwItems,
                        ),
                        Text(
                          'Invite Friends',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium!.apply(
                                fontSizeDelta: -2,
                              ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: PSizes.spaceBtwInputFields / 2,
              ),
              const ProfileListDividerSeperated()
            ],
          ),
        ),
      ),
    );
  }
}
