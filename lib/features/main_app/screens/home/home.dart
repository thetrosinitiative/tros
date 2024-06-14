import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tros/features/authentication/controllers/login_controller.dart';
import 'package:tros/features/main_app/screens/home/widgets/home_appbar.dart';
import 'package:tros/features/main_app/screens/home/widgets/home_blog.dart';
import 'package:tros/features/main_app/screens/home/widgets/home_info_card.dart';
import 'package:tros/features/main_app/screens/home/widgets/home_map.dart';
import 'package:tros/utils/constants/sizes.dart';

import 'widgets/home_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.spaceBtwSections),
          child: Column(
            children: [
              // Card containing information about the user tros coin, recycle rate etc
              HomeInfoCard(controller: controller),

              // SERVICES
              const HomeServices(),
              // MAP OF AREAS WITH SMART BIN CLOSE TO THE USER
              const SizedBox(
                height: PSizes.spaceBtwItems / 2,
              ),
              const HomeMap(),
              const SizedBox(
                height: PSizes.spaceBtwItems / 2,
              ),
              // NEWS CARD
              const HomeBlog()
            ],
          ),
        ),
      ),
    );
  }
}
