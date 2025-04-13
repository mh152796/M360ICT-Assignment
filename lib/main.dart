import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_360_assignment/src/core/di/initialize_bindings.dart';
import 'package:m_360_assignment/src/core/theme/app_theme.dart';
import 'package:m_360_assignment/src/feature/auth/view/pages/sign_in_screen.dart';

void main() {
   initializeAppBindings();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.appTheme,
      home: SignInScreen(),
    );
  }
}
