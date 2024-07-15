import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tros/common/widgets/appbar/boldAppbar.dart';
import 'package:tros/common/widgets/buttons/gradient_button.dart';
import 'package:tros/common/widgets/images/edge_rounded_images.dart';
import 'package:tros/features/personalization/controllers/userController.dart';
import 'package:tros/utils/constants/colors.dart';
import 'package:tros/utils/constants/enums.dart';
import 'package:tros/utils/constants/image_strings.dart';
import 'package:tros/utils/constants/sizes.dart';
import 'package:tros/utils/helpers/phone_number_helper.dart';
import 'package:tros/utils/validators/validation.dart';

import '../../../../common/widgets/icons/exchange_menu_icon.dart';
import '../../../../data/dummy_data/exchange_data.dart';
import '../../controllers/redeem/exchange_controller.dart';

class ExchangeDetails extends StatelessWidget {
  const ExchangeDetails({super.key, required this.exchange});
  final ExchangeDummyModel exchange;

  @override
  Widget build(BuildContext context) {
    final user = UserController.instance;
    final exchangeController = Get.put(ExchangeController());
    final phoneController = Get.put(PhoneNumberType());
    return Scaffold(
      backgroundColor: PColors.light,
      appBar: const BoldAppbar(
        text: 'Exchange',
        implyLeading: true,
        actionButton: ExchangeCounterIcon(),
        useScaffoldBgColor: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: PSizes.spaceBtwItems,
            ),
            PRoundedImage(
              imageUrl: exchange.image,
              height: 200,
              width: 407,
            ),
            const SizedBox(
              height: PSizes.spaceBtwItems,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exchange.title.toUpperCase(),
                      style: Theme.of(context).textTheme.headlineMedium!.apply(
                            fontWeightDelta: 2,
                            color: PColors.primary,
                          ),
                    ),
                    const SizedBox(
                      height: PSizes.spaceBtwItems / 2,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.currency_exchange_outlined,
                          color: PColors.primary,
                        ),
                        const SizedBox(
                          width: PSizes.spaceBtwItems / 2,
                        ),
                        Text('${exchange.amount} Tros coin',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(
                                    fontSizeDelta: 1,
                                    fontWeightDelta: 3,
                                    color: PColors.primary)),
                      ],
                    ),
                    const SizedBox(
                      height: PSizes.spaceBtwItems,
                    ),
                    Text(
                      exchange.bigDescription,
                      style: Theme.of(context).textTheme.labelMedium!.apply(
                            fontSizeDelta: 1,
                          ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: PSizes.spaceBtwItems,
                    ),
                    if (exchange.type == TransactionTypes.bank.name ||
                        exchange.type == TransactionTypes.airtime.name)
                      Form(
                        key: exchangeController.exchangeKey,
                        child: TextFormField(
                          keyboardType:
                              exchange.type == TransactionTypes.airtime.name
                                  ? TextInputType.phone
                                  : null,
                          onChanged: (value) {
                            if (exchange.type ==
                                TransactionTypes.airtime.name) {
                              // phoneController.changeInitialValue(value);
                              debugPrint(value);
                              debugPrint(phoneController.typeImage.value);

                              if (!value.isNumericOnly) {
                                return;
                              }
                              if (value.length > 3) {
                                var val = value.substring(0, 4);
                                phoneController.getNumberType(int.parse(val));
                              }
                              if (value.length < 4) {
                                phoneController.typeImage.value = '';
                                phoneController.typeImage.refresh();
                              }
                            }
                          },
                          controller: exchangeController.exchangeController,
                          decoration: InputDecoration(
                            suffixIcon: Obx(() {
                              if (phoneController.typeImage.value.isEmpty) {
                                return const SizedBox();
                              }
                              return PRoundedImage(
                                  borderRadius: 50,
                                  width: 5,
                                  height: 5,
                                  fit: BoxFit.contain,
                                  imageUrl: phoneController.typeImage.value);
                            }),
                            filled: false,
                            border: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: PColors.darkGrey)),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: PColors.darkGrey)),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: PColors.darkGrey)),
                            errorBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: PColors.warning)),
                            focusedErrorBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: PColors.warning)),
                            label: Text(
                              exchange.type == TransactionTypes.bank.name
                                  ? 'Account number*'
                                  : exchange.type == TransactionTypes.food.name
                                      ? 'exchange'
                                      : exchange.type ==
                                              TransactionTypes.airtime.name
                                          ? ' Phone number'
                                          : exchange.type ==
                                                  TransactionTypes.donate.name
                                              ? 'Donate'
                                              : 'Choose game',
                            ),
                            hintStyle:
                                Theme.of(context).textTheme.bodySmall!.apply(
                                      fontSizeDelta: 2,
                                    ),
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: PSizes.spaceBtwItems,
                    ),
                    // if (exchange.type == TransactionTypes.bank.name)
                    // Row(
                    //   children: [
                    //     SizedBox(
                    //         width: 12,
                    //         height: 19,
                    //         child: Checkbox(
                    //             activeColor: PColors.darkGrey,
                    //             value: false,
                    //             onChanged: (value) {})),
                    //     const SizedBox(
                    //       width: PSizes.spaceBtwItems,
                    //     ),
                    //     Text(
                    //       'This is my Account Number',
                    //       style: Theme.of(context)
                    //           .textTheme
                    //           .labelMedium!
                    //           .apply(color: PColors.black),
                    //     )
                    //   ],
                    // ),
                  ]),
            ),
            // const SizedBox(
            //   height: double.minPositive,
            //   child: Spacer(),
            // ),
          ],
        ),
      ),

      // ignore: prefer_const_constructors
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 110,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Remaining +1000 to exchange',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                          fontSizeDelta: 1,
                          fontWeightDelta: 3,
                          color: PColors.primary)),
                  Obx(() {
                    return Text(
                      'Your Tros coins: ${user.userModel.value.balance}',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            fontSizeDelta: 1,
                            fontWeightDelta: 3,
                          ),
                    );
                  })
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: GradientButton(
                text: exchange.type == TransactionTypes.donate.name
                    ? 'Donate'
                    : 'Exchange',
                width: 325,
                onPressed: () => exchangeController.makeTransaction(exchange),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
