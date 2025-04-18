import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_360_assignment/src/core/routes/routes_name.dart';
import 'package:m_360_assignment/src/feature/auth/view/pages/sign_in_screen.dart';
import 'package:m_360_assignment/src/feature/auth/view/pages/sign_up_screen.dart';
import 'package:m_360_assignment/src/feature/dashboard/view/pages/dashboard_screen.dart';
import 'package:m_360_assignment/src/feature/home/pages/home_screen.dart';


class AppRoutes {
  static  appRoutes() => [
    // RoutesName.splashPage.toGetPage(page: () => const SplashPage()),
  RoutesName.signInScreen.toGetPage(page: () => const SignInScreen(), ),
  RoutesName.signUpScreen.toGetPage(page: () => const SignUpScreen(), ),
  RoutesName.dashboardScreen.toGetPage(page: () => const DashboardScreen(), ),
  RoutesName.homeScreen.toGetPage(page: () => const HomeScreen(), ),

  ];
}

extension GetPageExtension on String {
  GetPage toGetPage({
    required Widget Function() page,
    List<Bindings> bindings = const [],
    List<GetMiddleware>? middlewares,
    Bindings? binding,
  }) {
    return GetPage(
      name: this,
      page: page,
      binding: binding,
      middlewares: middlewares,
      bindings: bindings,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 450),
      transition: Transition.leftToRightWithFade,
    );
  }
}
