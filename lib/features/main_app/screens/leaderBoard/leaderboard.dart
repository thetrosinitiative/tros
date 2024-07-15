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
import 'package:tros/features/redeem/screens/exchange/exchange.dart';
import 'package:tros/features/redeem/screens/redeem/redeem_detail/widgets/redeem_detail.dart';
import 'package:tros/utils/constants/colors.dart';
import 'package:tros/utils/constants/image_strings.dart';
import 'package:tros/utils/constants/sizes.dart';
import 'package:tros/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/images/circular_images.dart';
import '../../../../common/widgets/shimmers/product_shimmer.dart';
import '../../../../utils/helpers/cloud_helper.dart';
import '../../../redeem/controllers/redeem/product_controller.dart';

class RedeemPage extends StatelessWidget {
  const RedeemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    final productController = Get.put(ProductController());
    return Scaffold(
      backgroundColor: PColors.light,
      appBar: const BoldAppbar(text: 'Redeem'),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: PSizes.md, horizontal: PSizes.md - 4),
            child: TRoundedContainer(
              width: 353,
              height: 400,
              padding: const EdgeInsets.all(14),
              backgroundColor: PColors.primary.withOpacity(0.4),
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, __) {
                    return Row(
                      children: [
                        const PCircularImage(
                          imageUrl: PImages.appLogo,
                          backgroundColor: PColors.white,
                        ),
                        const SizedBox(
                          width: PSizes.spaceBtwItems,
                        ),
                        Column(
                          children: [
                            Text(
                              'Emma',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(
                              height: PSizes.spaceBtwItems / 2,
                            ),
                            Text(
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .apply(color: PColors.primary),
                              '700',
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (_, __) => const Divider(
                        color: PColors.dark,
                      ),
                  itemCount: 10),
            )),
      ),
    );
  }
}
