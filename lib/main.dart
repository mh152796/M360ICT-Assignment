import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:m_360_assignment/src/core/core_export.dart';
import 'package:m_360_assignment/src/core/di/initialize_bindings.dart';
import 'package:m_360_assignment/src/core/routes/routes.dart';
import 'package:m_360_assignment/src/core/routes/routes_name.dart';
import 'package:m_360_assignment/src/core/theme/app_theme.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   initializeAppBindings();
  FlutterNativeSplash.remove();
  runApp(const MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      title: 'M360ICT',
      theme: AppTheme.appTheme,
      getPages: AppRoutes.appRoutes(),
      initialRoute: Get.find<AuthController>().currentUser.value != null?
      RoutesName.dashboardScreen : RoutesName.signInScreen,
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..dismissOnTap = false // Optional: Prevent dismissing on tap
    ..userInteractions = false; // Disables all interactions
}
