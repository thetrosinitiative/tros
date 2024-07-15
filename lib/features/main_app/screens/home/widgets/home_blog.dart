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
            itemCount: blogList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  PRoundedImage(
                    imageUrl: blogList[index]['image'],
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
                        Text(blogList[index]['title']),
                        Row(
                          children: [
                            const PCircularImage(
                              imageUrl: PImages.appLogo,
                              width: 35,
                              height: 35,
                            ),
                            Expanded(
                              child: Text('Tros',
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .apply(
                                          fontWeightDelta: 2,
                                          color: PColors.primary)),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.timer_outlined,
                                  size: 17,
                                  color: PColors.primary,
                                ),
                                const SizedBox(
                                  width: PSizes.xs,
                                ),
                                Text(
                                  blogList[index]['date'],
                                  style: const TextStyle(
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

List<Map<String, dynamic>> blogList = [
  {
    'title':
        'Plastic pollution: Nigeria’s untapped ‘waste wealth’ fuels environmental disaster',
    'image': PImages.trash1,
    'date': '9 July 2024',
  },
  {
    'title':
        'Plastic Pollution Around the World: Rise in Global warming causing death',
    'image': PImages.trash2,
    'date': '10 July 2024',
  }
];
