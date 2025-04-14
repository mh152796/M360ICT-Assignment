import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_360_assignment/src/core/helper/responsive_helper.dart';
import 'package:m_360_assignment/src/core/utils/app_colors.dart';

class KPrimaryGreenButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String btnText;
  const KPrimaryGreenButton({super.key, required this.onPressed, required this.btnText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(

          fixedSize: Size(ResponsiveHelper.isMobile(context)? Get.width : 600, ResponsiveHelper.isMobile(context)? 40 : 50 ),
          backgroundColor: kGreenColor
        ),
        onPressed: () {
      
    }, child: Text(btnText, style: GoogleFonts.inter(
      color: Colors.white,
      fontSize: ResponsiveHelper.isMobile(context)? 16 : 18
    ),));
  }
}
