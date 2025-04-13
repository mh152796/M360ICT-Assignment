import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ResponsiveHelper {

  static bool isMobilePhone() {
    if (!kIsWeb) {
      return true;
    }else {
      return false;
    }
  }

  static bool isWeb() {
    return kIsWeb;
  }

  static bool isMobile(context) => MediaQuery.of(context).size.width <= 600;

  static bool isTab(context) {
    final size = MediaQuery
        .of(context)
        .size
        .width;
    if (size > 600 && size < 840) {
      return true;
    } else {
      return false;
    }
  }

  static bool isDesktop(context) => MediaQuery.of(context).size.width >= 840;
}