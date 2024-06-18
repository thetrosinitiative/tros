import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tros/common/widgets/appbar/boldAppbar.dart';
import 'package:tros/common/widgets/buttons/gradient_button.dart';
import 'package:tros/common/widgets/images/edge_rounded_images.dart';
import 'package:tros/utils/constants/colors.dart';
import 'package:tros/utils/constants/image_strings.dart';
import 'package:tros/utils/constants/sizes.dart';

class ExchangeDetails extends StatelessWidget {
  const ExchangeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PColors.light,
        appBar: BoldAppbar(
          text: 'Exchange',
          iconData: Icons.close,
          onPressed: () => Get.back(),
          useScaffoldBgColor: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: PSizes.spaceBtwItems,
              ),
              const PRoundedImage(
                imageUrl: PImages.alat,
                height: 200,
                width: 407,
              ),
              const SizedBox(
                height: PSizes.spaceBtwItems,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Alat by WEMA',
                        style:
                            Theme.of(context).textTheme.headlineMedium!.apply(
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
                          Text('10,000 Tros coin',
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
                        'There is good news! Now you can exchange your Tros coin for cash using ALAT by WEMA  with  as little as Tr 10,000, hurry up and exchange your tros points  now',
                        style: Theme.of(context).textTheme.labelMedium!.apply(
                              fontSizeDelta: 1,
                            ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: PSizes.spaceBtwItems,
                      ),
                      TextField(
                        decoration: InputDecoration(
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
                              borderSide:
                                  BorderSide(width: 1, color: PColors.warning)),
                          focusedErrorBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: PColors.warning)),
                          labelText: 'Account number*',
                          hintStyle:
                              Theme.of(context).textTheme.bodySmall!.apply(
                                    fontSizeDelta: 2,
                                  ),
                        ),
                      ),
                      const SizedBox(
                        height: PSizes.spaceBtwItems,
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: 12,
                              height: 19,
                              child: Checkbox(
                                  activeColor: PColors.darkGrey,
                                  value: false,
                                  onChanged: (value) {})),
                          const SizedBox(
                            width: PSizes.spaceBtwItems,
                          ),
                          Text(
                            'This is my Account Number',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(color: PColors.black),
                          )
                        ],
                      ),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Remaining +1000 to exchange',
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                            fontSizeDelta: 1,
                            fontWeightDelta: 3,
                            color: PColors.primary)),
                    Text(
                      'Your Tros coins: 15,000',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            fontSizeDelta: 1,
                            fontWeightDelta: 3,
                          ),
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: GradientButton(
                  text: 'Exchange',
                  width: 325,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ));
  }
}
