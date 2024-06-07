import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tros/features/main_app/screens/home/home.dart';
import 'package:tros/features/main_app/screens/map/map.dart';
import 'package:tros/features/main_app/screens/redeem/redeem.dart';
import 'package:tros/features/personalization/screens/profile/profile.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:tros/features/personalization/screens/settings/settings.dart';
// import 'package:tros/features/shop/screens/wishlist/wishlist.dart';
// import 'features/shop/screens/home/home.dart';
import 'package:tros/utils/constants/colors.dart';
import 'package:tros/utils/constants/sizes.dart';
import 'package:tros/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    final controller = Get.put(NavigationController());
    return Scaffold(
      backgroundColor: PColors.primary,
      bottomNavigationBar: Obx(
        () => Container(
          margin: const EdgeInsets.only(
              bottom: PSizes.spaceBtwSections,
              left: PSizes.spaceBtwItems,
              right: PSizes.spaceBtwItems),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          // padding: ,
          child: NavigationBar(
              // indicatorShape: null,
              backgroundColor: isDark ? PColors.black : PColors.white,
              indicatorColor: isDark
                  ? PColors.white.withOpacity(0.1)
                  : PColors.black.withOpacity(0.1),
              height: 60,
              elevation: 0,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) =>
                  controller.selectedIndex.value = index,
              destinations: const [
                NavigationDestination(
                    icon: Icon(AntDesign.home_outline), label: 'Home'),
                NavigationDestination(
                    icon: Icon(Iconsax.gift_outline), label: 'Store'),
                NavigationDestination(
                    icon: Icon(Iconsax.location_outline), label: 'Wishlist'),
                NavigationDestination(
                    icon: Icon(Iconsax.user_outline), label: 'Profile'),
              ]),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomePage(),
    const RedeemPage(),
    const MapPage(),
    const ProfilePage()
  ];
}
