import 'package:flutter/material.dart';
import 'package:tros/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/sizes.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });
  final String image, title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PSizes.defaultSpace),
      child: Column(
        children: [
          const SizedBox(
            height: PSizes.iconMd + 4,
          ),
          Image(
            width: PHelperFunctions.screenWidth() * 0.8,
            height: PHelperFunctions.screenHeight() * 0.55,
            image: AssetImage(image),
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .apply(letterSpacingDelta: 2, fontWeightDelta: -1),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: PSizes.spaceBtwItems,
          ),
          Text(
            subtitle,
            style:
                Theme.of(context).textTheme.bodyMedium!.apply(fontSizeDelta: 2),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
