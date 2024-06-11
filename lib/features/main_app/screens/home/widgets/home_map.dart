import 'package:flutter/material.dart';
import 'package:tros/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tros/common/widgets/images/edge_rounded_images.dart';
import 'package:tros/common/widgets/texts/section_heading.dart';
import 'package:tros/utils/constants/image_strings.dart';
import 'package:tros/utils/constants/sizes.dart';

class HomeMap extends StatelessWidget {
  const HomeMap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PSectionHeading(
          title: 'Smart-bin',
          showActionButton: false,
        ),
        SizedBox(
          height: PSizes.spaceBtwItems,
        ),
        TRoundedContainer(
          height: 364,
          width: 353,
          // backgroundColor: PColors.primary,
          radius: 16,
          child: Stack(
            children: [
              PRoundedImage(
                imageUrl: PImages.map,
                height: 364,
                width: 353,
              ),
              Positioned(
                top: 100,
                left: 50,
                child: PRoundedImage(
                  imageUrl: PImages.locate,
                  height: 32,
                  width: 32,
                ),
              ),
              Positioned(
                top: 100,
                right: 70,
                child: PRoundedImage(
                  imageUrl: PImages.locate,
                  height: 32,
                  width: 32,
                ),
              ),
              Positioned(
                bottom: 100,
                right: 50,
                child: PRoundedImage(
                  imageUrl: PImages.locate,
                  height: 32,
                  width: 32,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
