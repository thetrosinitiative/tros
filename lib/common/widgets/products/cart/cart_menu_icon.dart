import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../utils/constants/colors.dart';

class PCartCounterIcon extends StatelessWidget {
  const PCartCounterIcon({super.key, required this.iconColor});
  // final VoidCallback onPressed;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(() => const CartScreen()),
          icon: Icon(
            Iconsax.shopping_bag_bold,
            color: iconColor,
          ),
        ),
        Positioned(
          right: 3,
          top: 5,
          child: Badge(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            backgroundColor: PColors.dark.withOpacity(0.8),
            textColor: PColors.white,
            label: const Text(
              '2',
              style: TextStyle(fontSize: 10),
            ),
          ),
        )
      ],
    );
  }
}

class CartScreen {
  const CartScreen();
}
