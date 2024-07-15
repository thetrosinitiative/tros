import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tros/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tros/common/widgets/images/circular_images.dart';
import 'package:tros/features/authentication/controllers/login/login_controller.dart';
import 'package:tros/utils/constants/colors.dart';
import 'package:tros/utils/constants/image_strings.dart';

import '../../../../personalization/controllers/userController.dart';

class HomeInfoCard extends StatelessWidget {
  const HomeInfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = UserController.instance;
    return TRoundedContainer(
      width: 340,
      height: 190,
      backgroundColor: PColors.containerGrey,
      radius: 16,
      child: Column(
        children: [
          // Container containing the tros coin balance, recycle rate, tros coin image
          TRoundedContainer(
            height: 190 - 65,
            backgroundColor: PColors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Column containing the tros coin balance, recycle rate,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Tros coin text
                        Text(
                          'Available balance',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .apply(fontSizeDelta: -1),
                        ),
                        // Tros coin balance text
                        Row(
                          children: [
                            Obx(() {
                              return Text(
                                user.hideBalance.value
                                    ? '****'
                                    : user.userModel.value.balance.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .apply(fontSizeDelta: -14),
                              );
                            }),
                            Obx(() {
                              return IconButton(
                                padding: EdgeInsets.zero,
                                visualDensity: const VisualDensity(
                                    horizontal: 0, vertical: -4),
                                icon: Icon(
                                  user.hideBalance.value
                                      ? Iconsax.eye_slash_outline
                                      : Iconsax.eye_outline,
                                  size: 14,
                                ),
                                onPressed: () => user.hideBalance.value =
                                    !user.hideBalance.value,
                              );
                            }),
                          ],
                        ),
                        const PCircularImage(
                          imageUrl: PImages.tros,
                          backgroundColor: PColors.transparent,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // IconButton(
                        //   onPressed: () {},
                        //   icon: const Icon(Icons.notifications_none_outlined),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 4),
                          child: GestureDetector(
                            onTap: () {},
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Transaction history',
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .apply(
                                              decoration:
                                                  TextDecoration.underline)),
                                ]),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          TRoundedContainer(
            width: 353,
            radius: 16,
            height: 65,
            backgroundColor: PColors.white,
            child: Stack(
              children: [
                const PCircularImage(
                  width: 120,
                  imageUrl: PImages.dots,
                  backgroundColor: PColors.transparent,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 7,
                    ),
                    const PCircularImage(
                      width: 50,
                      imageUrl: PImages.trash,
                      backgroundColor: PColors.transparent,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '251 recycled plastic today',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const TRoundedContainer(
                            backgroundColor: PColors.primary,
                            width: 213.85,
                            height: 4,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios_outlined))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
