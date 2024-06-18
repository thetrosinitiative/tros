import 'package:flutter/material.dart';
import 'package:tros/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tros/common/widgets/images/circular_images.dart';
import 'package:tros/utils/constants/image_strings.dart';
import 'package:tros/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';

class TransactionDetailPage extends StatelessWidget {
  const TransactionDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: PColors.light,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Transaction Detail',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .apply(color: PColors.primary),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: TRoundedContainer(
                  radius: 100,
                  height: 70,
                  width: 70,
                  backgroundColor: PColors.primary,
                  shadow: [
                    BoxShadow(
                      color:
                          const Color.fromARGB(255, 53, 95, 52).withOpacity(.5),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  child: const PCircularImage(
                    width: 30,
                    height: 30,
                    imageUrl: PImages.tros,
                    backgroundColor: PColors.transparent,
                  ),
                ),
              ),
              const SizedBox(
                height: PSizes.spaceBtwItems * 2,
              ),
              Text(
                'Transaction Success',
                style: Theme.of(context).textTheme.headlineLarge!.apply(
                    color: PColors.primary,
                    fontSizeDelta: -5,
                    fontWeightDelta: 3),
              ),
              const SizedBox(
                height: PSizes.spaceBtwItems / 2,
              ),
              Text(
                '18 october 2024 - 11:56:06 WIB - No ref 1278200067',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .apply(fontWeightDelta: 2, fontSizeDelta: -1),
              ),

              const SizedBox(
                height: PSizes.spaceBtwItems * 1.5,
              ),
              Text(
                'You have earned 4 tros!',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: PColors.primary),
              ),
              const SizedBox(
                height: PSizes.spaceBtwItems,
              ),
              // CUSTOMER DETAILS
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Account Name',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .apply(fontWeightDelta: 1),
                              ),
                              Text(
                                'Chibuzor',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .apply(fontWeightDelta: 1),
                              )
                            ])
                      ],
                    ),
                    const SizedBox(
                      height: PSizes.spaceBtwItems,
                    ),
                    const Divider(
                      color: PColors.dark,
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                    ),
                    const SizedBox(
                      height: PSizes.spaceBtwItems / 2,
                    ),
                    // TRANSACTION DETAILS
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Transaction Detail',
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .apply(fontWeightDelta: 2, fontSizeDelta: 1),
                      ),
                    ),
                    const SizedBox(
                      height: PSizes.spaceBtwItems / 1.2,
                    ),

                    Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Submitter's Name",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .apply(
                                      fontWeightDelta: 1,
                                    ),
                              ),
                              Text(
                                'Daniel',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .apply(
                                      fontWeightDelta: 1,
                                    ),
                              )
                            ])
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
