import 'package:flutter/material.dart';
import 'package:tros/utils/constants/colors.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class PLoginHeader extends StatelessWidget {
  const PLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            PTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium!.apply(
                color: PColors.primary,
                fontWeightDelta: 1,
                letterSpacingDelta: 2),
          ),
        ),
        const SizedBox(
          height: PSizes.spaceBtwItems,
        ),
        const Center(
          child: Image(
            height: 150,
            image: AssetImage(
              PImages.login,
            ),
          ),
        ),
        Text(
          'Login',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .apply(color: PColors.primary, fontWeightDelta: -1),
        ),
      ],
    );
  }
}
