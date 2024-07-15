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

import '../../../personalization/controllers/userController.dart';

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
  late MobileScannerController _controller;

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (!_controller.value.isInitialized) {
  //     return;
  //   }
  //   switch (state) {
  //     case AppLifecycleState.resumed:
  //       _controller.start();
  //     case AppLifecycleState.paused:
  //     case AppLifecycleState.detached:
  //     case AppLifecycleState.hidden:
  //       return;
  //     case AppLifecycleState.inactive:
  //       _controller.stop();
  //   }
  //   super.didChangeAppLifecycleState(state);
  // }

  @override
  void initState() {
    // WidgetsBinding.instance.addObserver(this);
    _controller = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates,
      returnImage: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = UserController.instance;
    return MobileScanner(
      fit: BoxFit.cover,
      // overlayBuilder: (_, __) => const TRoundedContainer(
      //   backgroundColor: PColors.transparent,
      //   radius: 50,
      //   width: 300,
      //   height: 300,
      // ),
      // scanWindow: Rect.,
      controller: _controller,
      onDetect: (capture) {
        debugPrint(capture.barcodes.toString());
        final List<Barcode> barcodes = capture.barcodes;
        final Uint8List? image = capture.image;
        for (var barcode in barcodes) {
          debugPrint(barcode.rawValue);
        }
        if (image != null) {
          user.userModel.value.balance = user.userModel.value.balance + 200;
          user.userModel.refresh();
          user.saveBalance(user.userModel.value.balance.toInt());
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

  @override
  void dispose() {
    // WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    super.dispose();
  }
}
