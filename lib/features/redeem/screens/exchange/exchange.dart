import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tros/common/widgets/appbar/boldAppbar.dart';
import 'package:tros/common/widgets/appbar/searchBar.dart';
import 'package:tros/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tros/common/widgets/images/edge_rounded_images.dart';
import 'package:tros/features/redeem/screens/exchange/details.dart';
import 'package:tros/utils/constants/colors.dart';
import 'package:tros/utils/constants/image_strings.dart';
import 'package:tros/utils/constants/sizes.dart';

import '../../../../common/widgets/icons/exchange_menu_icon.dart';
import '../../../../data/dummy_data/exchange_data.dart';

class ExchangePage extends StatelessWidget {
  const ExchangePage({super.key});

  @override
  Widget build(BuildContext context) {
    // DUMMY EXCHANGE
    final exchanges = ExchangeDummy();
    return Scaffold(
      backgroundColor: PColors.light,
      appBar: const BoldAppbar(
        text: 'Exchange',
        implyLeading: true,
        actionButton: ExchangeCounterIcon(
          iconColor: PColors.primary,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: PSizes.md, horizontal: PSizes.md - 4),
          child: Column(
            children: [
              // SEARCH BAR
              const TSearchBar(
                prefixWidget: Icon(
                  Iconsax.search_normal_1_outline,
                  color: PColors.primary,
                  size: 20,
                ),
                hintText: 'Search goods',
                color: PColors.white,
                radius: 67,
                useBorder: false,
              ),
              const SizedBox(
                height: PSizes.lg,
              ),

              // EXCHANGE
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: exchanges.getExchangeLength(),
                itemBuilder: (_, index) {
                  final data = exchanges.getExchange(index);
                  return Center(
                    child: TRoundedContainer(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      width: 350,
                      height: 295,
                      backgroundColor: PColors.transparent,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 10,
                            left: 5.3,
                            child: TRoundedContainer(
                              width: 325,
                              height: 150,
                              padding: const EdgeInsets.only(
                                left: 4,
                                right: 4,
                                bottom: 18,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // EXCHANGE TITLE
                                        Text(data.title.toUpperCase(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .apply(
                                                    fontSizeDelta: -2,
                                                    fontWeightDelta: 1)),
                                        // EXCHANGE SUBTITLE
                                        Text(data.description,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .apply(
                                                    fontWeightDelta: -1,
                                                    fontSizeDelta: -2)),
                                        // const SizedBox(
                                        //   height: PSizes.spaceBtwItems,
                                        // ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const PRoundedImage(
                                            imageUrl: PImages.tros,
                                            width: 33,
                                            height: 33,
                                          ),
                                          Text('${data.amount} Tros coin',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall!
                                                  .apply(
                                                      fontSizeDelta: -1,
                                                      fontWeightDelta: 1,
                                                      color: PColors.primary)),
                                        ],
                                      ),
                                      // const SizedBox(
                                      //   width: 50,
                                      // ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        child: ElevatedButton(
                                            onPressed: () =>
                                                Get.to(() => ExchangeDetails(
                                                      exchange: data,
                                                    )),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 3,
                                                  horizontal: 18.0),
                                              child: Text('Exchange'),
                                            )),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          // EXCHANGE
                          PRoundedImage(
                              borderRadius: 20,
                              backgroundColor: PColors.transparent,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              imageUrl: data.image,
                              width: 350,
                              height: 170),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(
                  height: PSizes.spaceBtwItems,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
