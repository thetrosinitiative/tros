import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tros/common/widgets/appbar/boldAppbar.dart';
import 'package:tros/features/main_app/screens/scanner/transaction_details.dart';
import 'package:tros/features/redeem/controllers/redeem/cart_controller.dart';

import 'package:tros/utils/constants/sizes.dart';

import '../../../../common/loaders/animation_loader.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/image_strings.dart';
import '../redeem/transact_success.dart';
import 'widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Scaffold(
      appBar: const BoldAppbar(
        text: 'Cart',
        useAction: false,
        implyLeading: true,
      ),
      body: Obx(() {
        final emptyAnimationWidget = AnimationLoaderWidget(
          text: 'Whoops! Your Cart is empty!',
          animation: PImages.empty1,
          showAction: true,
          actionText: 'Let\'s fill it',
          onActionPressed: () => Get.offAll(() => const NavigationMenu()),
        );
        if (cartController.cartItems.isEmpty) {
          return emptyAnimationWidget;
        } else {
          return const SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(PSizes.defaultSpace),
                child: CartItems()),
          );
        }
      }),
      bottomNavigationBar: cartController.cartItems.isEmpty
          ? const SizedBox(
              // height: PSizes.defaultSpace,
              )
          : Padding(
              padding: const EdgeInsets.all(PSizes.defaultSpace),
              child: ElevatedButton(
                  onPressed: () => Get.to(TransactSuccess(
                        isShop: true,
                        cartItem: cartController.cartItems,
                      )),
                  child: Obx(() {
                    return Text(
                        'Checkout TR ${cartController.totalCartPrice.value}');
                  })),
            ),
    );
  }
}
