import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tros/common/widgets/images/circular_images.dart';
import 'package:tros/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:tros/features/main_app/screens/scanner/scanner.dart';
import 'package:tros/features/personalization/controllers/userController.dart';
import 'package:tros/features/personalization/screens/settings.dart';
import 'package:tros/features/personalization/screens/profile/user_profile.dart';
import 'package:tros/utils/constants/image_strings.dart';
import 'package:tros/utils/constants/sizes.dart';
import 'package:tros/utils/device/device_utility.dart';
import 'package:tros/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/colors.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;
    return AppBar(
      leadingWidth: PHelperFunctions.screenWidth() / 2,
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: const EdgeInsets.all(4.0),
        child: GestureDetector(
          onTap: () => Get.to(() => const ProfileScreen()),
          child: Row(
            children: [
              const SizedBox(
                width: PSizes.spaceBtwSections,
              ),
              const PCircularImage(
                width: 40,
                height: 40,
                imageUrl: PImages.appLogo,
                backgroundColor: PColors.containerGrey,
              ),
              const SizedBox(
                width: PSizes.spaceBtwItems / 1.5,
              ),
              Obx(() {
                return Text(
                  'Hi ${userController.userModel.value.firstName}',
                  style: Theme.of(context).textTheme.titleLarge,
                );
              })
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () => Get.to(() => const ScannerPage()),
            icon: const Icon(Iconsax.scan_barcode_outline)),
        const CartCounterIcon(iconColor: PColors.primary),
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
