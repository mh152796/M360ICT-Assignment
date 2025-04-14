import 'package:flutter/gestures.dart';
import 'package:m_360_assignment/src/core/core_export.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: MediaQuery.of(context).padding.top + 20),
        child: Column(
          mainAxisAlignment: ResponsiveHelper.isMobile(context)? MainAxisAlignment.start : MainAxisAlignment.center,
          crossAxisAlignment: ResponsiveHelper.isMobile(context)? CrossAxisAlignment.start: CrossAxisAlignment.center,
          children: [

            Text(
              "Sign Up",
              style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: kBlackColor,
              ),
            ),
            Text(
              "Let’s save environment together",
              style: GoogleFonts.inter(
                  color: kBlackColor,
                  fontSize: ResponsiveHelper.isMobile(context)? 14 : 16
              ),
            ),
            Spacer(),
            SizedBox(
              width: ResponsiveHelper.isMobile(context)? Get.width :  600 ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(labelText: "Name", hintText: "e.g: Ahmed Ariyan"),
                  Gap(15),
                  CustomTextField(labelText: "Phone", hintText: "17XXXXXXXX"),
                  Gap(15),
                  CustomTextField(labelText: "Email", hintText: "user@example.com"),
                  Gap(15),
                  Obx(
                        () => CustomTextField(
                      labelText: "Password",
                      hintText: "**********",
                      suffixWidget: GestureDetector(
                        onTap: () {
                          authController.isObscure.toggle();
                        },
                        child: SvgPicture.asset(AssetsPath.obscureEye),
                      ),
                      isObscureText: authController.isObscure.value,
                    ),
                  ),
                  Gap(15),
                  Obx(
                        () => CustomTextField(
                      labelText: "Confirm Password",
                      hintText: "**********",
                      suffixWidget: GestureDetector(
                        onTap: () {
                          authController.isConfirmPasswordObscure.toggle();
                        },
                        child: SvgPicture.asset(AssetsPath.obscureEye),
                      ),
                      isObscureText: authController.isConfirmPasswordObscure.value,
                    ),
                  ),
                    Gap(20),
                  KPrimaryGreenButton(
                    btnText: "Sign Up",
                    onPressed: () {

                  },),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text("Or Sign Up with", style: GoogleFonts.inter(
                        fontSize: ResponsiveHelper.isMobile(context)? 12 : 14,
                        color: Color.fromRGBO(173, 173, 173, 1)
                    ),),
                  ),

                  SocialLoginWidget(),
                ],),
            ),

            Expanded(child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gap(15),
                  RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: GoogleFonts.inter(color: Color.fromRGBO(173, 173, 173, 1), fontSize: ResponsiveHelper.isMobile(context)? 12 : 14),
                      children: [
                        TextSpan(
                          text: "Sign In",
                          style: GoogleFonts.inter(
                            color: kGreenColor, // Change this to match your theme
                            fontSize: ResponsiveHelper.isMobile(context)? 14 : 16,
                            fontWeight: FontWeight.w700,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                             Get.back();
                            },
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: RichText(
                      text: TextSpan(
                        text: "Powered by ",
                        style: GoogleFonts.inter(color: Color.fromRGBO(173, 173, 173, 1), fontSize: ResponsiveHelper.isMobile(context)? 12 : 14),
                        children: [
                          TextSpan(
                            text: "M360 ICT",
                            style: GoogleFonts.inter(
                              color: kGreenColor, // Change this to match your theme
                              fontSize: ResponsiveHelper.isMobile(context)? 14 : 16,
                              fontWeight: FontWeight.w700,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Handle Sign Up tap
                              },
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
