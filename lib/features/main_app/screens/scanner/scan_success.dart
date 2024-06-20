import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tros/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tros/common/widgets/images/edge_rounded_images.dart';
import 'package:tros/utils/constants/colors.dart';
import 'package:tros/utils/constants/image_strings.dart';
import 'package:tros/utils/constants/sizes.dart';
import 'package:tros/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/images/circular_images.dart';
import 'transaction_details.dart';

class ScanSuccessPage extends StatelessWidget {
  const ScanSuccessPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final isDark = PHelperFunctions.isDarkMode(context);
    // final controller = Get.put(ValidatorController());

    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: !isDark ? PColors.light : PColors.dark,
    //   statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
    //   systemStatusBarContrastEnforced: true,
    // ));
    return Scaffold(
      backgroundColor: PColors.light,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Validated',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .apply(color: PColors.primary),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                'Success',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .apply(color: PColors.primary),
              ),
              Text(
                'Tros transfer completed',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .apply(fontWeightDelta: 2),
              ),
              Lottie.asset(PImages.success,
                  repeat: true, width: 150, height: 150),
              const SizedBox(height: PSizes.spaceBtwItems),
              Text('Fun Fact #1',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .apply(fontWeightDelta: 2)),
              const SizedBox(
                height: PSizes.spaceBtwItems / 2,
              ),
              Text(
                "Did you know, Earth's ozone hole is getting smaller, the impact of the ban on the use of CFC gas",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(fontWeightDelta: 0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: PSizes.spaceBtwItems),
              Text(
                '-eea europa',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(fontWeightDelta: 0),
                textAlign: TextAlign.center,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: PSizes.spaceBtwItems,
                  ),
                  const Text('Waste ID:PD123412'),
                  const SizedBox(
                    height: PSizes.spaceBtwItems,
                  ),
                  GestureDetector(
                    onTap: () => Get.off(() => const TransactionDetailPage()),
                    child: const TRoundedContainer(
                      showBorder: true,
                      borderColor: PColors.primary,
                      backgroundColor: PColors.white,
                      child: Center(
                          child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text('Receipt'),
                      )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 9),
        child: TRoundedContainer(
          height: 120,
          width: 300,
          radius: 5,
          child: Expanded(
            child: Row(
              children: [
                const PRoundedImage(
                  padding: EdgeInsetsDirectional.zero,
                  imageUrl: PImages.earth,
                  width: 90,
                  height: 90,
                  borderRadius: 5,
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: PSizes.xs,
                        ),
                        const Flexible(
                          child: Text('International'),
                        ),
                        const SizedBox(
                          height: PSizes.xs,
                        ),
                        Text(
                            'Humanity healed the ozone hole. Can we do the same in subswequent time.',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.bodySmall!.apply()),
                        Row(
                          children: [
                            const PCircularImage(
                              imageUrl: PImages.appLogo,
                              width: 35,
                              height: 35,
                            ),
                            Expanded(
                              child: Text('USA Today',
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .apply(
                                          fontWeightDelta: 2,
                                          fontSizeDelta: -1)),
                            ),
                            const Row(
                              children: [
                                Icon(
                                  Icons.timer_outlined,
                                  size: 17,
                                ),
                                SizedBox(
                                  width: PSizes.xs,
                                ),
                                Text(
                                  '7 October 2023',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class ValidatorController extends GetxController {
//   static ValidatorController get instance => Get.find();

//   final isSuccess = false.obs;

//   @override
//   onInit() {
//     checkIsSuccess();
//     super.onInit();
//   }

//   checkIsSuccess() {
//     Timer(const Duration(seconds: 5), () => isSuccess.value = true);
//   }

//   @override
//   void onClose() {
//     isSuccess.value = false;
//     super.onClose();
//   }
// }
