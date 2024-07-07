import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tros/features/redeem/controllers/redeem/cart_controller.dart';

import '../../../../features/redeem/screens/cart/cart.dart';
import '../../../../utils/constants/colors.dart';

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({super.key, required this.iconColor});
  // final VoidCallback onPressed;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(() => const CartScreen()),
          icon: Icon(
            Iconsax.shopping_bag_outline,
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
                controller.noOfCartItems.value.toString(),
                style: const TextStyle(fontSize: 10),
              );
            }),
          ),
        )
      ],
    );
  }
}
