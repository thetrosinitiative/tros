import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tros/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tros/common/widgets/images/edge_rounded_images.dart';
import 'package:tros/utils/constants/colors.dart';
import 'package:tros/utils/constants/image_strings.dart';
import 'package:tros/utils/constants/sizes.dart';
import 'package:tros/utils/device/device_utility.dart';
import 'package:tros/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/images/circular_images.dart';
import '../../../main_app/screens/scanner/transaction_details.dart';
import '../../controllers/redeem/cart_controller.dart';
import '../../controllers/redeem/exchange_controller.dart';
import '../../models/cart_item_model.dart';
import '../../models/redeem/exchange_model.dart';

class TransactSuccess extends StatelessWidget {
  const TransactSuccess(
      {super.key,
      this.isExchange = false,
      this.isRecycle = false,
      this.isShop = false,
      this.exchange,
      this.cartItem});
  final bool isExchange, isRecycle, isShop;
  final List<ExchangeModel>? exchange;
  final List<CartItemModel>? cartItem;

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    final controller = Get.put(ValidatorController());
    final cart = CartController.instance;
    final exchangeController = ExchangeController.instance;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: !isDark ? PColors.light : PColors.dark,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      systemStatusBarContrastEnforced: true,
    ));
    return Scaffold(
      backgroundColor: PColors.light,
      appBar: AppBar(
        centerTitle: true,
        title: Obx(() {
          return Text(
            controller.isSuccess.value
                ? 'Transaction successful'
                : 'Processing..',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .apply(color: PColors.primary),
          );
        }),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(PSizes.defaultSpace),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: PDeviceUtils.getScreenHeight() / 10,
                ),
                Obx(() {
                  return Text(
                    controller.isSuccess.value ? 'Success' : 'Please wait...',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .apply(color: PColors.primary),
                  );
                }),
                Obx(() {
                  return Text(
                    controller.isSuccess.value
                        ? 'Your purchase was successful'
                        : 'we are processing your transaction',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(fontWeightDelta: 2),
                  );
                }),
                Obx(() {
                  return Lottie.asset(
                      controller.isSuccess.value
                          ? PImages.success
                          : PImages.loading2,
                      repeat: true,
                      width: 150,
                      height: 150);
                }),
                const SizedBox(height: PSizes.spaceBtwItems),
                Text('Fun Fact #1',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(fontWeightDelta: 2)),
                const SizedBox(
                  height: PSizes.spaceBtwItems / 2,
                ),
                Text(
                  "Did you know, Earth's ozone hole is getting smaller, the impact of the ban on the use of CFC gas",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(fontWeightDelta: 0),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: PSizes.spaceBtwItems),
                Text(
                  '-eea europa',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(fontWeightDelta: 0),
                  textAlign: TextAlign.center,
                ),
                Obx(() {
                  if (controller.isSuccess.value) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: PSizes.spaceBtwItems,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (isExchange) {
                              exchangeController.exchangeModels.clear();
                              exchangeController.exchangeQuantityInCart.value =
                                  0;
                              exchangeController.exchangeModels.refresh();
                            }
                            if (isShop) {
                              cart.cartItems.clear();
                              cart.noOfCartItems.value = 0;
                              // update()
                            }
                            Get.off(() => TransactionDetailPage(
                                  cartItem: cartItem,
                                  isShop: isShop,
                                  isExchange: isExchange,
                                  isRecycle: isRecycle,
                                  exchange: exchange,
                                ));
                          },
                          child: const TRoundedContainer(
                            showBorder: true,
                            borderColor: PColors.primary,
                            backgroundColor: PColors.white,
                            child: Center(
                                child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('Receipt'),
                            )),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                })
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 9),
        child: TRoundedContainer(
          height: 120,
          width: 300,
          radius: 5,
          child: Row(
            children: [
              const PRoundedImage(
                padding: EdgeInsetsDirectional.zero,
                imageUrl: PImages.earth,
                width: 90,
                height: 90,
                borderRadius: 5,
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: PSizes.xs,
                      ),
                      const Flexible(
                        child: Text('International'),
                      ),
                      const SizedBox(
                        height: PSizes.xs,
                      ),
                      Text(
                          'Humanity healed the ozone hole. Can we do the same in subswequent time.',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodySmall!.apply()),
                      Row(
                        children: [
                          const PCircularImage(
                            imageUrl: PImages.appLogo,
                            width: 35,
                            height: 35,
                          ),
                          Expanded(
                            child: Text('USA Today',
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .apply(
                                        fontWeightDelta: 2, fontSizeDelta: -1)),
                          ),
                          const Row(
                            children: [
                              Icon(
                                Icons.timer_outlined,
                                size: 17,
                              ),
                              SizedBox(
                                width: PSizes.xs,
                              ),
                              Text(
                                '7 October 2023',
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ValidatorController extends GetxController {
  static ValidatorController get instance => Get.find();

  final isSuccess = false.obs;

  @override
  onInit() {
    checkIsSuccess();
    super.onInit();
  }

  checkIsSuccess() {
    Timer(const Duration(seconds: 5), () => isSuccess.value = true);
  }

  @override
  void onClose() {
    isSuccess.value = false;
    super.onClose();
  }
}
