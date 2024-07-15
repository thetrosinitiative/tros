import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tros/common/widgets/appbar/boldAppbar.dart';

import 'package:tros/utils/constants/sizes.dart';

import '../../../../common/loaders/animation_loader.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../controllers/redeem/exchange_controller.dart';
import '../redeem/transact_success.dart';
import 'widgets/transaction_items.dart';
// import 'widgets/cart_items.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final exchangeController = ExchangeController.instance;

    return Scaffold(
      appBar: const BoldAppbar(
        text: 'Exchanges',
        useAction: false,
        implyLeading: true,
      ),
      body: Obx(() {
        final emptyAnimationWidget = AnimationLoaderWidget(
          text: 'Whoops! No transaction at the moment',
          animation: PImages.empty1,
          showAction: true,
          actionText: 'Let\'s fill it',
          onActionPressed: () => Get.offAll(() => const NavigationMenu()),
        );
        if (exchangeController.exchangeModels.isEmpty) {
          return emptyAnimationWidget;
        } else {
          return const SingleChildScrollView(
            // physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
                padding: EdgeInsets.all(PSizes.defaultSpace),
                child: TransactionItems()),
          );
        }
      }),
      bottomNavigationBar: exchangeController.exchangeModels.isEmpty
          ? const SizedBox(
              // height: PSizes.defaultSpace,
              )
          : Padding(
              padding: const EdgeInsets.all(PSizes.defaultSpace),
              child: ElevatedButton(
                  onPressed: () => Get.to(TransactSuccess(
                        isExchange: true,
                        exchange: exchangeController.exchangeModels,
                      )),
                  child: Obx(() {
                    return Text(
                        'Transact TR ${exchangeController.totalPrice.value}');
                  })),
            ),
    );
  }
}
