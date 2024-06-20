import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tros/features/main_app/screens/scanner/scan_success.dart';
import 'package:tros/features/main_app/screens/scanner/scan_validate.dart';
import 'package:tros/features/main_app/screens/scanner/scanner.dart';
import 'package:tros/utils/constants/image_strings.dart';
import 'package:tros/utils/constants/sizes.dart';
import 'package:tros/utils/device/device_utility.dart';
import 'package:tros/utils/helpers/helper_functions.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: PHelperFunctions.screenWidth() / 2,
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            const SizedBox(
              width: PSizes.spaceBtwSections,
            ),
            const CircleAvatar(
              backgroundImage: AssetImage(PImages.appLogo),
            ),
            const SizedBox(
              width: PSizes.spaceBtwItems,
            ),
            Text(
              'Hi Daniel',
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
      ),
      actions: [
        IconButton(
            onPressed: () => Get.to(() => const ScannerPage()),
            icon: const Icon(Iconsax.scan_barcode_outline)),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(PDeviceUtils.getAppBarHeight());
}
//
