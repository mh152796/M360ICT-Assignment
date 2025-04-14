 import 'package:flutter/gestures.dart';
import 'package:m_360_assignment/src/core/core_export.dart';
import 'package:m_360_assignment/src/core/routes/routes_name.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
              "Sign In",
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
                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => Row(
                        children: [
                          Checkbox(
                            value: authController.rememberMe.value,
                            onChanged: (val) {
                              authController.rememberMe.value = val!;
                            },
                            activeColor: kGreenColor, // fill color when checked
                            side: const BorderSide(
                              color: kGreenColor, // border when unchecked
                              width: 2,
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          ),
                          Text(
                            "Remember Me",
                            style: GoogleFonts.inter(
                              fontSize: ResponsiveHelper.isMobile(context)? 14 : 16,
                              fontWeight: FontWeight.w400,
                              color: kBlackColor,
                            ),
                          ),
                        ],
                      ))
              ,
                      GestureDetector(
                        onTap: () {
                          // Handle forgot password tap
                        },
                        child: Text(
                          "Forgotten Password",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: kGreenColor,
                            fontWeight: FontWeight.w700,
                            decorationColor: kGreenColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(20),
                  KPrimaryGreenButton(
                    btnText: "Sign In",
                    onPressed: () {

                  },),
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 20.0),
                     child: Text("Or Sign In with", style: GoogleFonts.inter(
                      fontSize: ResponsiveHelper.isMobile(context)? 12 : 14,
                      color: Color.fromRGBO(173, 173, 173, 1)
                                       ),),
                   ),
                   SocialLoginWidget(),
                ],),
            ),
             Expanded(child: Center(
              child: Column(
                 children: [
                   Gap(15),
                  RichText(
                    text: TextSpan(
                      text: "Don’t have an account? ",
                      style: GoogleFonts.inter(color: Color.fromRGBO(173, 173, 173, 1), fontSize: ResponsiveHelper.isMobile(context)? 12 : 14),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: GoogleFonts.inter(
                            color: kGreenColor, // Change this to match your theme
                            fontSize: ResponsiveHelper.isMobile(context)? 14 : 16,
                            fontWeight: FontWeight.w700,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(RoutesName.signUpScreen);
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
