import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tros/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tros/common/widgets/images/circular_images.dart';
import 'package:tros/common/widgets/images/edge_rounded_images.dart';
import 'package:tros/common/widgets/texts/section_heading.dart';
import 'package:tros/features/authentication/controllers/login_controller.dart';
import 'package:tros/features/main_app/screens/home/widgets/home_appbar.dart';
import 'package:tros/features/main_app/screens/home/widgets/home_blog.dart';
import 'package:tros/features/main_app/screens/home/widgets/home_info_card.dart';
import 'package:tros/features/main_app/screens/home/widgets/home_map.dart';
import 'package:tros/utils/constants/colors.dart';
import 'package:tros/utils/constants/image_strings.dart';
import 'package:tros/utils/constants/sizes.dart';
import 'package:tros/utils/device/device_utility.dart';
import 'package:tros/utils/helpers/helper_functions.dart';

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
