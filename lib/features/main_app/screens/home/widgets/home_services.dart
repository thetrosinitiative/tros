import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tros/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tros/common/widgets/images/edge_rounded_images.dart';
import 'package:tros/common/widgets/texts/section_heading.dart';
import 'package:tros/features/main_app/screens/map/map.dart';
import 'package:tros/features/main_app/screens/scanner/scanner.dart';
import 'package:tros/utils/constants/colors.dart';
import 'package:tros/utils/constants/image_strings.dart';
import 'package:tros/utils/constants/sizes.dart';

import '../../../../../data/dummy_data/exchange_data.dart';
import '../../../../redeem/screens/exchange/details.dart';

class HomeServices extends StatelessWidget {
  const HomeServices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PSectionHeading(
          title: 'Services',
          showActionButton: false,
        ),
        SizedBox(
          height: 90,
          child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 10),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final images = [
                  PImages.smTrash,
                  PImages.plasticPlain,
                  PImages.rewardPlain,
                  PImages.search
                ];
                final strings = ['Locate', 'Recycle', 'Cashout', 'Airtime'];
                final pages = [
                  const MapPage(),
                  const ScannerPage(),
                  ExchangeDetails(
                    exchange: ExchangeDummy.exchangeData[0],
                  ),
                  ExchangeDetails(
                    exchange: ExchangeDummy.exchangeData[1],
                  ),
                  const MapPage(),
                ];
                return GestureDetector(
                  onTap: () => Get.to(() => pages[index]),
                  child: TRoundedContainer(
                    height: 20,
                    width: 70,
                    radius: 16,
                    backgroundColor: PColors.primary,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: PSizes.spaceBtwItems / 2,
                        ),
                        PRoundedImage(
                          color: PColors.white,
                          imageUrl: images[index],
                          height: 20,
                          width: 20,
                          backgroundColor: PColors.transparent,
                        ),
                        const SizedBox(
                          height: PSizes.spaceBtwItems / 2,
                        ),
                        Text(
                          strings[index],
                          style: Theme.of(context).textTheme.titleMedium!.apply(
                              fontWeightDelta: 2,
                              color: PColors.white,
                              fontSizeDelta: -5),
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(
                    width: PSizes.spaceBtwItems / 1.3,
                  ),
              itemCount: 4),
        ),
      ],
    );
  }
}
