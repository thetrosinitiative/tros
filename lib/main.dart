import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'data/repositories/authentication_repository/authentication_repository.dart';

Future<void> main() async {
  //   Add Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  // Init local storage
  await GetStorage.init();
  // Todo: init payment methods
  //  Await Native Splash
  // Initialize Authentication

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Initial firebase and authentication
  // Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // ).then((FirebaseApp value) =>
  Get.put(AuthenticationRepository());

// Load all the material design / Themes / Localization / Bindings
  // runApp(DevicePreview(
  //   builder: (BuildContext context) {
  //     return const App();
  //   },
  // ));
  runApp(const App());
}
