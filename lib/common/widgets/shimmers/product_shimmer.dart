import 'package:flutter/material.dart';
import 'package:tros/common/widgets/custom_shapes/containers/rounded_container.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../layouts/gid_layout.dart';
import 'shimmer.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({
    super.key,
    this.itemCount = 4,
  });
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return PGridLayout(
        itemCount: itemCount,
        itemBuilder: (_, __) => const TRoundedContainer(
              width: 164,
              height: 210,
              backgroundColor: PColors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // IMAGE
                  TShimmerEffect(height: 160, width: 164),
                  SizedBox(
                    height: PSizes.spaceBtwItems,
                  ),
                  // TEXT
                  TShimmerEffect(
                      width: 110, height: 17, color: PColors.lightGrey),
                  SizedBox(
                    height: PSizes.spaceBtwItems / 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TShimmerEffect(width: 110, height: 15),
                      TShimmerEffect(
                        width: 15,
                        height: 15,
                        radius: 100,
                      ),
                    ],
                  ),
                ],
              ),
            ));
  }
}
