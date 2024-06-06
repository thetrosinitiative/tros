import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tros/utils/helpers/helper_functions.dart';
// import 'package:tros/features/authentication/screens/onboarding/onboarding.dart';
import 'package:tros/utils/theme/theme.dart';

import 'utils/constants/colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: !isDark ? PColors.white : PColors.dark,
      statusBarIconBrightness: Brightness.dark,
      systemStatusBarContrastEnforced: true,
    ));
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const Scaffold(
        backgroundColor: PColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
