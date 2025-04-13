import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_360_assignment/src/core/custom_widgets/custom_text_field.dart';
import 'package:m_360_assignment/src/core/utils/asset_path.dart';
import 'package:m_360_assignment/src/feature/auth/controller/auth_controller.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
     return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sign In"),
              Text("Let’s save environment together"),
              CustomTextField(
                labelText: "Email",
                hintText: "user@example.com",
              ),

             Obx(() =>  CustomTextField(
               labelText: "Password",
               hintText: "**********",
               suffixWidget: GestureDetector(
                   onTap: () {
                     authController.isObscure.toggle();
                   },
                   child: SvgPicture.asset(AssetsPath.obscureEye, )),
               isObscureText: authController.isObscure.value,
             ),),
            ],
          ),
        ),
      ),
    );
  }
}
