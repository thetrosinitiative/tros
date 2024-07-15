import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/helpers/helper_functions.dart';
import '../../../../../common/widgets/products/cart/exchange_item.dart';
import '../../../controllers/redeem/exchange_controller.dart';

class TransactionItems extends StatelessWidget {
  const TransactionItems({super.key, this.showAddRemoveButton = true});
  final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    // final isDark = PHelperFunctions.isDarkMode(context);
    final exchangeController = ExchangeController.instance;
    return Obx(() {
      return ListView.separated(
        itemCount: exchangeController.exchangeModels.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) {
          final item = exchangeController.exchangeModels[index];
          return Column(
            children: [
              ExchangeItem(
                exchangeItem: item,
              ),
              if (showAddRemoveButton)
                const SizedBox(
                  height: PSizes.spaceBtwItems,
                ),
              // ADD AND REMOVE BUTTONS

              if (showAddRemoveButton)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        // extra space
                        SizedBox(
                          width: 89,
                        ),
                        // ADD REMOVE BUTTON
                        // ProductAddAndRemove(
                        //   width: 32,
                        //   height: 32,
                        //   addColor: PColors.white,
                        //   addBgColor: PColors.primary,
                        //   minusColor: isDark ? PColors.white : PColors.black,
                        //   minusBgColor:
                        //       isDark ? PColors.darkerGrey : PColors.light,
                        //   text: item.quantity.toString(),
                        //   addOnPressed: () =>
                        //       exchangeController.a(item),
                        //   minusOnPressed: () =>
                        //       exchangeController.removeItemFromCart(item),
                        // ),
                      ],
                    ),
                    // PRODUCT TOTAL PRICE
                    ProductPriceText(price: (item.amount).toStringAsFixed(1))
                  ],
                )
            ],
          );
        },
        separatorBuilder: (_, __) => const SizedBox(
          height: PSizes.spaceBtwSections,
        ),
      );
    });
  }
}
