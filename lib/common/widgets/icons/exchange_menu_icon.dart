import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tros/features/main_app/screens/scanner/transaction_details.dart';
import 'package:tros/features/redeem/controllers/redeem/cart_controller.dart';
import 'package:tros/features/redeem/screens/transactions/transactions.dart';

import '../../../features/redeem/controllers/redeem/exchange_controller.dart';
import '../../../features/redeem/screens/cart/cart.dart';
import '../../../utils/constants/colors.dart';

class ExchangeCounterIcon extends StatelessWidget {
  const ExchangeCounterIcon({super.key, this.iconColor = PColors.primary});
  // final VoidCallback onPressed;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExchangeController());

    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(() => const TransactionScreen()),
          icon: Icon(
            Iconsax.gift_outline,
            color: iconColor,
          ),
        ),
        Positioned(
          right: 3,
          top: 5,
          child: Badge(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            backgroundColor: PColors.primary.withOpacity(0.8),
            textColor: PColors.white,
            label: Obx(() {
              return Text(
                controller.exchangeQuantityInCart.value.toString(),
                style: const TextStyle(fontSize: 10),
              );
            }),
          ),
        )
      ],
    );
  }
}
