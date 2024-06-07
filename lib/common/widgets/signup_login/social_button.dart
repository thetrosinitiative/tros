import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class PSocialButton extends StatelessWidget {
  const PSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return Stack(
      children: [
        const Center(
          child: Image(
            height: 170,
            image: AssetImage(
              PImages.nature,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: isDark ? PColors.primary : PColors.white,
                    elevation: 2),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage(PImages.google),
                      height: PSizes.iconMd,
                    ),
                    const SizedBox(
                      width: PSizes.spaceBtwItems,
                    ),
                    Text(
                      'Continue with Google',
                      style: TextStyle(
                          color: !isDark ? PColors.dark : PColors.white),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: PSizes.spaceBtwItems,
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //         backgroundColor: isDark ? PColors.primary : PColors.white,
            //         elevation: 2),
            //     onPressed: () {},
            //     child: Row(
            //       mainAxisSize: MainAxisSize.max,
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         const Image(
            //           image: AssetImage(PImages.github),
            //           height: PSizes.iconMd,
            //         ),
            //         const SizedBox(
            //           width: PSizes.spaceBtwItems,
            //         ),
            //         Text(
            //           'Continue with Github',
            //           style: TextStyle(
            //               color: !isDark ? PColors.dark : PColors.white),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}
