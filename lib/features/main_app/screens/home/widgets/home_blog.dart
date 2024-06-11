import 'package:flutter/material.dart';
import 'package:tros/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tros/common/widgets/images/circular_images.dart';
import 'package:tros/common/widgets/images/edge_rounded_images.dart';
import 'package:tros/common/widgets/texts/section_heading.dart';
import 'package:tros/utils/constants/colors.dart';
import 'package:tros/utils/constants/image_strings.dart';
import 'package:tros/utils/constants/sizes.dart';

class HomeBlog extends StatelessWidget {
  const HomeBlog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      width: 373,
      // padding: EdgeInsets.all(9),
      child: Column(
        children: [
          const PSectionHeading(
            title: 'Blog',
            showActionButton: true,
          ),
          const SizedBox(
            height: PSizes.spaceBtwItems / 2,
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              const img = [PImages.smartphone, PImages.brown];
              return Column(
                children: [
                  PRoundedImage(
                    imageUrl: img[index],
                    width: 373,
                    height: 183,
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwItems / 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NIGERIA',
                          style: Theme.of(context).textTheme.labelLarge!.apply(
                              fontWeightDelta: 2, color: PColors.primary),
                        ),
                        const SizedBox(
                          height: PSizes.spaceBtwItems / 2,
                        ),
                        const Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit in id lorem ipsum dolor sit'),
                        Row(
                          children: [
                            const PCircularImage(
                              imageUrl: PImages.appLogo,
                              width: 35,
                              height: 35,
                            ),
                            Expanded(
                              child: Text('Greenpacking',
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .apply(
                                          fontWeightDelta: 2,
                                          color: PColors.primary)),
                            ),
                            const Row(
                              children: [
                                Icon(
                                  Icons.timer_outlined,
                                  size: 17,
                                  color: PColors.primary,
                                ),
                                SizedBox(
                                  width: PSizes.xs,
                                ),
                                Text(
                                  '7 October 2023',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: PColors.primary,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
            separatorBuilder: (_, __) => const SizedBox(
              height: PSizes.spaceBtwItems,
            ),
          ),
        ],
      ),
    );
  }
}
