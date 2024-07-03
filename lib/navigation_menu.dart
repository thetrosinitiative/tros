import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tros/features/main_app/screens/exchange/exchange.dart';
import 'package:tros/features/main_app/screens/home/home.dart';
import 'package:tros/features/main_app/screens/map/map.dart';
import 'package:tros/features/main_app/screens/redeem/redeem.dart';
import 'package:tros/features/personalization/screens/profile/profile.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:tros/features/personalization/screens/settings/settings.dart';
// import 'package:tros/features/shop/screens/wishlist/wishlist.dart';
// import 'features/shop/screens/home/home.dart';
import 'package:tros/utils/constants/colors.dart';
import 'package:tros/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    final controller = Get.put(NavigationController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
          margin: const EdgeInsets.all(20),
          height: size.width * .155,
          decoration: BoxDecoration(
            color: isDark ? PColors.black : PColors.white,
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? PColors.white.withOpacity(.15)
                    : Colors.black.withOpacity(.15),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
            borderRadius: BorderRadius.circular(50),
          ),
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: size.width * .024),
            itemBuilder: (context, index) => InkWell(
              onTap: () => controller.selectedIndex.value = index,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      margin: EdgeInsets.only(
                        bottom: index == controller.selectedIndex.value
                            ? 0
                            : size.width * .029,
                        right: size.width * .0422,
                        left: size.width * .0422,
                      ),
                      width: size.width * .128,
                      height: index == controller.selectedIndex.value
                          ? size.width * .014
                          : 0,
                      decoration: const BoxDecoration(
                        color: PColors.primary,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(10),
                        ),
                      ),
                    );
                  }),
                  Obx(() {
                    return Icon(
                      controller.listOfIcons[index],
                      size: size.width * .076,
                      color: index == controller.selectedIndex.value
                          ? PColors.primary
                          : Colors.black38,
                    );
                  }),
                  SizedBox(height: size.width * .03),
                ],
              ),
            ),
          )),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomePage(),
    const RedeemPage(),
    const ExchangePage(),
    const ProfilePage()
  ];
  final List<IconData> listOfIcons = [
    Icons.home_rounded,
    Iconsax.shop_outline,
    Iconsax.gift_bold,
    Icons.person_rounded,
  ];
}
