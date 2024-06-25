import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tros/utils/constants/image_strings.dart';
import 'package:tros/utils/constants/sizes.dart';
import 'package:tros/utils/constants/text_strings.dart';

import '../../../../common/widgets/emailing/reusable_email.dart';
import '../../controllers/signup/email_verification_controller.dart';
import '../login/login.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, required this.email});

  final String email;
  @override
  Widget build(BuildContext context) {
    final emailController = Get.put(EmailVerificationController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace),
          child: ReusableEmailWidget(
            image: PImages.emailDeliveredImage,
            title: PTexts.confirmEmail,
            subtitle: PTexts.confirmEmailSubtitle,
            elevatedaBtnText: PTexts.acontinue,
            textBtnText: PTexts.resendEmail,
            doneOnpressed: () =>
                Get.to(() => emailController.checkEmailVerificationStatus()),
            resendeOnpressed: () => emailController.verifyUserEmail(),
          ),
        ),
      ),
    );
  }
}
