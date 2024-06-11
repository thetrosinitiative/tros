import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tros/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tros/common/widgets/images/circular_images.dart';
import 'package:tros/features/authentication/controllers/login_controller.dart';
import 'package:tros/utils/constants/colors.dart';
import 'package:tros/utils/constants/image_strings.dart';

class HomeInfoCard extends StatelessWidget {
  const HomeInfoCard({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      width: 353,
      height: 206,
      backgroundColor: PColors.containerGrey,
      radius: 16,
      child: Column(
        children: [
          // Container containing the tros coin balance, recycle rate, tros coin image
          TRoundedContainer(
            height: 206 - 65,
            backgroundColor: PColors.transparent,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
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
                          'Tros Coin',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        // Tros coin balance text
                        Row(
                          children: [
                            Text(
                              '10,080',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .apply(fontSizeDelta: -10),
                            ),
                            IconButton(
                              icon: Icon(
                                controller.hidePassword.value
                                    ? Iconsax.eye_slash_outline
                                    : Iconsax.eye_outline,
                                size: 14,
                              ),
                              onPressed: () => controller.hidePassword.value =
                                  !controller.hidePassword.value,
                            ),
                          ],
                        ),
                        // Tros Recycle rate
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '780',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .apply(
                                          fontWeightDelta: 4, fontSizeDelta: 2),
                                ),
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: const BoxDecoration(
                                      color: PColors.primary,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(70),
                                        topRight: Radius.circular(70),
                                      )),
                                )
                              ],
                            ),
                            // Recycle rate
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Recycle rate',
                                  style: TextStyle(
                                      color: PColors.black,
                                      fontSize: 10,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w500),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const PCircularImage(
                          imageUrl: PImages.tros,
                          backgroundColor: PColors.transparent,
                        ),
                        TRoundedContainer(
                          backgroundColor: PColors.borderPrimary,
                          width: 135,
                          radius: 8,
                          height: 36,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2.0, horizontal: 4),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  'Tros coin 1,000=\$0.01',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    'convert',
                                    style: TextStyle(
                                        color: PColors.black,
                                        fontSize: 10,
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
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
