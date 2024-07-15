import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tros/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tros/common/widgets/images/circular_images.dart';
import 'package:tros/features/authentication/controllers/login/login_controller.dart';
import 'package:tros/features/main_app/screens/home/widgets/home_appbar.dart';
import 'package:tros/features/main_app/screens/home/widgets/home_blog.dart';
import 'package:tros/features/main_app/screens/home/widgets/home_info_card.dart';
import 'package:tros/features/main_app/screens/home/widgets/home_map.dart';
import 'package:tros/utils/constants/image_strings.dart';

import 'package:tros/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';
import 'widgets/home_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(PSizes.spaceBtwSections),
          child: Column(
            children: [
              // Card containing information about the user tros coin, recycle rate etc
              HomeInfoCard(),

              // SERVICES
              HomeServices(),
              // MAP OF AREAS WITH SMART BIN CLOSE TO THE USER
              SizedBox(
                height: PSizes.spaceBtwItems / 2,
              ),
              HomeMap(),
              // const SizedBox(height: PSizes.spaceBtwItems / 2),

              // Column(
              //   children: [
              //     const PSectionHeading(
              //       title: 'Leaderboard',
              //       showActionButton: true,
              //     ),
              //     const SizedBox(height: PSizes.spaceBtwItems / 2),
              //     TRoundedContainer(
              //       width: 353,
              //       height: 150,
              //       backgroundColor: PColors.primary.withOpacity(0.4),
              //       child: const Row(
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           LeaderboardWidget(),
              //           LeaderboardWidget(),
              //           LeaderboardWidget(),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: PSizes.spaceBtwItems / 2,
              ),
              // NEWS CARD
              HomeBlog()
            ],
          ),
        ),
      ),
    );
  }
}

class LeaderboardWidget extends StatelessWidget {
  const LeaderboardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const TRoundedContainer(
        width: 63,
        height: 63,
        radius: 63,
        backgroundColor: Colors.orange,
        child: Center(
          child: PCircularImage(
            width: 60,
            height: 60,
            imageUrl: PImages.appLogo,
            backgroundColor: PColors.white,
          ),
        ),
      ),
      const SizedBox(
        height: PSizes.spaceBtwItems / 2,
      ),
      Text(
        'Emma',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      const SizedBox(
        height: PSizes.spaceBtwItems / 2,
      ),
      Text(
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .apply(color: PColors.primary),
        '700',
      ),
    ]);
  }
}
