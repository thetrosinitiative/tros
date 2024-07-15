import 'package:flutter/material.dart';
import 'package:tros/features/redeem/models/redeem/exchange_model.dart';

import '../../../../features/redeem/models/cart_item_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/edge_rounded_images.dart';
import '../../texts/brand_text_title_with_icon.dart';
import '../../texts/product_title_text.dart';

class ExchangeItem extends StatelessWidget {
  const ExchangeItem({
    super.key,
    required this.exchangeItem,
  });
  final ExchangeModel exchangeItem;
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        // IMAGE
        PRoundedImage(
          isNetworkImage: true,
          imageUrl: exchangeItem.image ?? '',
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(PSizes.md),
          backgroundColor: isDark ? PColors.darkerGrey : PColors.light,
        ),
        const SizedBox(
          width: PSizes.spaceBtwItems,
        ),

        // TITLE , PRICE, SIZE
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // BrandTitleTextWithVerifiedIcon(title: cartItem.brandName ?? ''),
              Flexible(
                child: ProductTitleText(
                  title: exchangeItem.title,
                  maxLines: 1,
                ),
              ),
              // /ATTRIBUTES

              // Text.rich(
              //   TextSpan(
              //     children: (cartItem.selectedVariation ?? {})
              //         .entries
              //         .map(
              //           (e) => TextSpan(
              //             children: [
              //               TextSpan(
              //                 text: e.key,
              //                 style: Theme.of(context).textTheme.bodySmall,
              //               ),
              //               TextSpan(
              //                 text: e.value,
              //                 style: Theme.of(context).textTheme.bodyLarge,
              //               ),
              //             ],
              //           ),
              //         )
              //         .toList(),
              //   ),
              // ),
            ],
          ),
        )
      ],
    );
  }
}
