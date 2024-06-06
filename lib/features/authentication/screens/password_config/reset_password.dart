import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tros/common/widgets/emailing/reusable_email.dart';
import 'package:tros/utils/constants/image_strings.dart';
import 'package:tros/utils/constants/sizes.dart';
import 'package:tros/utils/constants/text_strings.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace),
          child: Column(
            children: [
              // IMAGE WITH 60% OF SCREEN WIDTH
              // TITLE AND AND SUBTITLE
              // BUTTONS
              ReusableEmailWidget(
                  image: PImages.emailDeliveredImage,
                  title: PTexts.changePasswordTitle,
                  subtitle: PTexts.changePasswordSubtitle,
                  elevatedaBtnText: PTexts.done,
                  textBtnText: PTexts.resendEmail,
                  eOnpressed: () {},
                  tOnpressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
