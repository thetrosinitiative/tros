import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tros/common/builders/listdividerseperated.dart';
import 'package:tros/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tros/features/personalization/controllers/listTileController.dart';
import 'package:tros/utils/constants/colors.dart';
import 'package:tros/utils/constants/image_strings.dart';
import 'package:tros/utils/constants/sizes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
              Text(
                'Oke Daniel',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .apply(fontSizeDelta: 4, fontWeightDelta: 4),
              ),
              const SizedBox(
                height: PSizes.spaceBtwItems / 2,
              ),
              Text(
                'danial123@gmail.com',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: PSizes.spaceBtwItems,
              ),
              // INFO CARD
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TRoundedContainer(
                    borderColor: PColors.primary,
                    backgroundColor: PColors.containerGrey,
                    padding: const EdgeInsets.all(8),
                    width: 168,
                    height: 97,
                    showBorder: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.supervised_user_circle_rounded),
                        const Text('Your plan'),
                        Text(
                          'Plastic Recycling journey',
                          style: Theme.of(context).textTheme.titleMedium!.apply(
                                fontSizeDelta: -3,
                                fontWeightDelta: 5,
                              ),
                        )
                      ],
                    ),
                  ),
                  TRoundedContainer(
                    borderColor: PColors.primary,
                    backgroundColor: PColors.containerGrey,
                    padding: const EdgeInsets.all(8),
                    width: 168,
                    height: 97,
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
                          style: Theme.of(context).textTheme.titleMedium!.apply(
                                fontSizeDelta: -2,
                                fontWeightDelta: 5,
                              ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: PSizes.spaceBtwSections,
              ),
              const ProfileListDividerSeperated()
            ],
          ),
        ),
      ),
    );
  }
}
