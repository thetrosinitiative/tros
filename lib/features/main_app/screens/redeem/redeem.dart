import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tros/common/builders/gridviewbuilder.dart';
import 'package:tros/common/widgets/appbar/boldAppbar.dart';
import 'package:tros/common/widgets/appbar/searchBar.dart';
import 'package:tros/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tros/common/widgets/icons/circular_icon.dart';
import 'package:tros/common/widgets/images/edge_rounded_images.dart';
import 'package:tros/common/widgets/texts/section_heading.dart';
import 'package:tros/features/main_app/screens/exchange/exchange.dart';
import 'package:tros/features/main_app/screens/redeem/redeem_detail/widgets/redeem_detail.dart';
import 'package:tros/utils/constants/colors.dart';
import 'package:tros/utils/constants/image_strings.dart';
import 'package:tros/utils/constants/sizes.dart';
import 'package:tros/utils/helpers/helper_functions.dart';

class RedeemPage extends StatelessWidget {
  const RedeemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return Scaffold(
        backgroundColor: PColors.light,
        appBar: const BoldAppbar(text: 'Redeem'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: PSizes.md, horizontal: PSizes.md - 4),
            child: Column(
              children: [
                // SEARCH BAR
                const TSearchBar(
                  prefixWidget: Icon(
                    Iconsax.search_normal_1_outline,
                    color: PColors.primary,
                    size: 20,
                  ),
                  hintText: 'Search goods',
                  color: PColors.white,
                  radius: 67,
                  useBorder: false,
                ),
                const SizedBox(
                  height: PSizes.lg,
                ),
                // OFFERS SLIDER

                CarouselSlider(
                  items: const [
                    PRoundedImage(
                      imageUrl: PImages.brown,
                      width: 350,
                      height: 206,
                    )
                  ],
                  options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1,
                  ),
                ),
                const SizedBox(
                  height: PSizes.spaceBtwSections,
                ),
                // NEW ARRIVALS
                // BEST SELLING
                Column(
                  children: [
                    PSectionHeading(
                      title: 'Best selling',
                      showActionButton: true,
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: PSizes.spaceBtwItems,
                    ),

                    // BEST SELLING ITEMS

                    GridViewBuilder(
                      mainAxisExtent: 220,
                      child: GestureDetector(
                        onTap: () => Get.to(() => const RedeemDetail()),
                        child: TRoundedContainer(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 10.0),
                          width: 164,
                          backgroundColor: PColors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Center(
                                child: PRoundedImage(
                                  backgroundColor: PColors.white,
                                  imageUrl: PImages.bottle,
                                  height: 155,
                                  width: 133,
                                ),
                              ),
                              Text(
                                'WATER BOTTLE',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .apply(
                                        fontSizeDelta: 1, fontWeightDelta: 1),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '12 Tros coins',
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .apply(
                                            fontSizeDelta: 4,
                                            fontWeightDelta: 1,
                                            color: PColors.primary),
                                  ),
                                  GestureDetector(
                                      onTap: () {},
                                      child: const Center(
                                        child: PCircularIcon(
                                          backgroundColor: PColors.primary,
                                          icon: Icons.add,
                                          width: 25,
                                          height: 25,
                                          size: 18,
                                          color: PColors.white,
                                        ),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                // FOR YOU
              ],
            ),
          ),
        ),
        floatingActionButton: PCircularIcon(
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? PColors.white.withOpacity(.15)
                  : Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          backgroundColor: PColors.primary,
          color: PColors.white,
          icon: Iconsax.gift_bold,
          size: 30,
          width: 55,
          height: 55,
          onPressed: () => Get.to(() => const ExchangePage()),
        ));
  }
}
