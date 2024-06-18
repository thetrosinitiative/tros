import 'package:flutter/material.dart';
import 'package:tros/common/builders/gridviewbuilder.dart';
import 'package:tros/common/widgets/appbar/boldAppbar.dart';
import 'package:tros/common/widgets/buttons/bottom_elevated_button.dart';
import 'package:tros/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tros/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:tros/common/widgets/images/edge_rounded_images.dart';
import 'package:tros/common/widgets/products/cart/add_remove_button.dart';
import 'package:tros/utils/constants/colors.dart';
import 'package:tros/utils/constants/image_strings.dart';
import 'package:tros/utils/constants/sizes.dart';

class RedeemDetail extends StatelessWidget {
  const RedeemDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BoldAppbar(
        text: 'Gadgets',
        implyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // PRODUCT IMAGE VIEW
            const PCurvedEdgesWidget(
              child: TRoundedContainer(
                backgroundColor: PColors.light,
                height: 330,
                radius: 0,
                width: double.infinity,
                child: Column(
                  children: [
                    Center(
                      child: PRoundedImage(
                        imageUrl: PImages.earbud,
                      ),
                    ),
                    SizedBox(
                      height: PSizes.spaceBtwItems,
                    ),
                  ],
                ),
              ),
            ),

            // PRODUCT DETAILS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'AIRPOD',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(fontSizeDelta: 6, fontWeightDelta: 4),
                        ),
                        ProductAddAndRemove(
                          width: 35,
                          height: 36,
                          addColor: PColors.white,
                          addBgColor: PColors.primary,
                          minusColor: PColors.darkGrey,
                          minusBgColor: PColors.light,
                          text: '4',
                          addOnPressed: () {},
                          minusOnPressed: () {},
                        )
                      ]),
                  const SizedBox(
                    height: PSizes.spaceBtwItems,
                  ),
                  Text(
                    '1kg, 40TR',
                    style: Theme.of(context).textTheme.labelLarge!.apply(
                        fontSizeDelta: 7,
                        fontWeightDelta: 3,
                        color: PColors.primary),
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwItems,
                  ),
                  Text(
                    'Airpods are the most popular gadgets in the world. Airpods are made of a single piece of fabric, which can be made from a variety of materials. Airpods can be used for a variety of purposes, such as playing games, watching movies, or watching television.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(fontSizeDelta: 0, fontWeightDelta: 2),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwSections,
                  ),
                  // PRODUCT RATINGS
                  GridViewBuilder(
                      mainAxisExtent: 67,
                      child: TRoundedContainer(
                        width: 165,
                        showBorder: true,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const PRoundedImage(
                              imageUrl: PImages.star,
                              width: 35,
                              height: 35,
                              backgroundColor: PColors.white,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                          text: '4.8 ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .apply(
                                                fontSizeDelta: 6,
                                                fontWeightDelta: 3,
                                                color: PColors.primary,
                                              )),
                                      TextSpan(
                                          text: '(15)',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium),
                                    ],
                                  ),
                                ),
                                Text('Reviews',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium)
                              ],
                            )
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: PSizes.spaceBtwItems,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomElevatedButton(
        text: 'Add to cart',
      ),
    );
  }
}
