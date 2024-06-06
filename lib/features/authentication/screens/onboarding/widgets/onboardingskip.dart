import 'package:flutter/material.dart';
import 'package:tros/utils/constants/colors.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: PDeviceUtils.getAppBarHeight(),
      right: PSizes.defaultSpace,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.skipPage(),
        child: const Text(
          'Skip',
          style: TextStyle(color: PColors.primary),
        ),
      ),
    );
  }
}
