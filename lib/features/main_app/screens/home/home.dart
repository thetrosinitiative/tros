import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tros/utils/constants/colors.dart';
import 'package:tros/utils/constants/image_strings.dart';
import 'package:tros/utils/constants/sizes.dart';
import 'package:tros/utils/helpers/helper_functions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              onPressed: () {}, icon: Icon(Iconsax.scan_barcode_outline)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.notifications_none_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: PColors.warning,
        ),
      ),
    );
  }
}
// 