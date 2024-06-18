import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:tros/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tros/features/main_app/screens/scanner/scan_validate.dart';
import 'package:tros/utils/constants/colors.dart';
import 'package:tros/utils/constants/sizes.dart';
import 'package:tros/utils/device/device_utility.dart';

import '../../../../common/widgets/buttons/gradient_button.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ScannerPage extends StatelessWidget {
  const ScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PColors.transparent,
        body: SizedBox(
          height: PDeviceUtils.getScreenHeight(),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: PSizes.appBarHeight * 2),

                Text(
                  'Scan recycling code',
                  style: Theme.of(context).textTheme.headlineMedium!.apply(
                      fontSizeDelta: 3,
                      fontWeightDelta: 1,
                      color: PColors.primary),
                ),
                const SizedBox(height: PSizes.appBarHeight * 2),

                Column(
                  children: [
                    const TRoundedContainer(
                        radius: 50,
                        width: 300,
                        height: 300,
                        // backgroundColor: PColors.primary,
                        child: QRScanner()),
                    const SizedBox(height: PSizes.spaceBtwItems),
                    Text('Place phone well to scan',
                        style: Theme.of(context).textTheme.labelSmall!.apply(
                            fontSizeDelta: 4,
                            fontWeightDelta: 1,
                            color: PColors.primary)),
                  ],
                ),
                // GradientButton(
                //   text: 'Scan',
                //   onPressed: () => Get.to(() => const ScanValidateScreen()),
                // ),
              ],
            ),
          ),
        ));
  }
}

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: !isDark ? PColors.dark : PColors.dark,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      systemStatusBarContrastEnforced: true,
    ));
    return MobileScanner(
      controller: MobileScannerController(
        detectionSpeed: DetectionSpeed.noDuplicates,
        returnImage: true,
      ),
      onDetect: (capture) {
        debugPrint(capture.barcodes.toString());
        final List<Barcode> barcodes = capture.barcodes;
        final Uint8List? image = capture.image;
        for (var barcode in barcodes) {
          debugPrint(barcode.rawValue);
        }
        if (image != null) {
          Get.off(() => const ScanValidateScreen());
        } else {
          showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                    content: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Error scanning widget'),
                    ),
                  ));
        }
      },
    );
  }
}
