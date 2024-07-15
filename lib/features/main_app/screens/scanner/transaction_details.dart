import 'package:flutter/material.dart';
import 'package:tros/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tros/common/widgets/images/circular_images.dart';
import 'package:tros/features/personalization/controllers/userController.dart';
import 'package:tros/features/redeem/controllers/redeem/cart_controller.dart';
import 'package:tros/utils/constants/image_strings.dart';
import 'package:tros/utils/constants/sizes.dart';

import '../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../redeem/models/cart_item_model.dart';
import '../../../redeem/models/redeem/exchange_model.dart';

class TransactionDetailPage extends StatelessWidget {
  const TransactionDetailPage(
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
    final user = UserController.instance;

    return Scaffold(
      backgroundColor: PColors.light,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Transaction Detail',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .apply(color: PColors.primary),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: TRoundedContainer(
                  radius: 100,
                  height: 70,
                  width: 70,
                  backgroundColor: PColors.primary,
                  shadow: [
                    BoxShadow(
                      color:
                          const Color.fromARGB(255, 53, 95, 52).withOpacity(.5),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  child: const PCircularImage(
                    width: 30,
                    height: 30,
                    imageUrl: PImages.tros,
                    backgroundColor: PColors.transparent,
                  ),
                ),
              ),
              const SizedBox(
                height: PSizes.spaceBtwItems * 2,
              ),
              Text(
                'Transaction Receipt',
                style: Theme.of(context).textTheme.headlineLarge!.apply(
                    color: PColors.primary,
                    fontSizeDelta: -5,
                    fontWeightDelta: 3),
              ),
              const SizedBox(
                height: PSizes.spaceBtwItems / 2,
              ),
              Text(
                '9 JULY 2024 - 11:56:06 WAT - No ref 1278200067',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .apply(fontWeightDelta: 2, fontSizeDelta: -1),
              ),

              const SizedBox(
                height: PSizes.spaceBtwItems * 1.5,
              ),
              Text(
                isShop!
                    ? 'Your purchase is on its way'
                    : isExchange!
                        ? 'exchange was successful'
                        : 'You have earned 4 tros!',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: PColors.primary),
              ),
              const SizedBox(
                height: PSizes.spaceBtwItems,
              ),
              // CUSTOMER DETAILS
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        UserTransactField(
                          field1: 'Account name',
                          field2: user.userModel.value.fullName,
                        ),
                        UserTransactField(
                            field1: 'Account ID',
                            field2: user.userModel.value.id),
                        UserTransactField(
                            field1: 'Phone Number',
                            field2: user.userModel.value.phoneNumber),
                        UserTransactField(
                            field1: 'Email',
                            field2: user.userModel.value.email),
                      ],
                    ),
                    const SizedBox(
                      height: PSizes.spaceBtwItems,
                    ),
                    const Divider(
                      color: PColors.dark,
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                    ),
                    const SizedBox(
                      height: PSizes.spaceBtwItems / 2,
                    ),
                    // TRANSACTION DETAILS
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Transaction Detail',
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .apply(fontWeightDelta: 2, fontSizeDelta: 1),
                      ),
                    ),
                    const SizedBox(
                      height: PSizes.spaceBtwItems / 1.2,
                    ),

                    TransactionSubDetail(
                      field1: isShop!
                          ? 'Type'
                          : isExchange!
                              ? 'Type'
                              : "submitter's name",
                      field2: isShop!
                          ? 'Redeem'
                          : isExchange!
                              ? 'Exchange'
                              : 'You have earned 4 tros!',
                    ),
                    TransactionSubDetail(
                      field1: isShop!
                          ? 'Total count'
                          : isExchange!
                              ? 'Total count'
                              : "submitter's name",
                      field2: isShop!
                          ? cartItem!.length.toString()
                          : isExchange!
                              ? exchange!.length.toString()
                              : 'You have earned 4 tros!',
                    ),
                    //    TransactionSubDetail(
                    //   field1: isShop!
                    //       ? 'Total price'
                    //       : isExchange!
                    //           ? 'Total price'
                    //           : "submitter's name",
                    //   field2: isShop!
                    //       ? cartItem!.length.toString()
                    //       : isExchange!
                    //           ? exchange!.length.toString()
                    //           : 'You have earned 4 tros!',
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionSubDetail extends StatelessWidget {
  const TransactionSubDetail({
    super.key,
    required this.field1,
    required this.field2,
  });
  final String field1, field2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            field1,
            style: Theme.of(context).textTheme.labelMedium!.apply(
                  fontWeightDelta: 1,
                ),
          ),
          Text(
            field2,
            style: Theme.of(context).textTheme.labelMedium!.apply(
                  fontWeightDelta: 1,
                ),
          )
        ]),
        const SizedBox(
          height: PSizes.spaceBtwItems / 2,
        )
      ],
    );
  }
}

class UserTransactField extends StatelessWidget {
  const UserTransactField({
    super.key,
    required this.field1,
    required this.field2,
  });
  final String field1, field2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            field1,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .apply(fontWeightDelta: 1),
          ),
          Text(
            field2,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .apply(fontWeightDelta: 1),
          )
        ]),
        const SizedBox(
          height: PSizes.spaceBtwItems / 2,
        )
      ],
    );
  }
}
