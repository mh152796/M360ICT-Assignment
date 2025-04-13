import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final bool isObscureText;
  final Widget? suffixWidget;
  final TextInputType inputType;
  const CustomTextField({super.key, this.inputType = TextInputType.text, this.isObscureText = false, required this.labelText, required this.hintText, this.controller, this.suffixWidget});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscureText,
      keyboardType: inputType,
      autofillHints: inputType == TextInputType.name ? [AutofillHints.name]
          : inputType == TextInputType.emailAddress ? [AutofillHints.email]
          : inputType == TextInputType.phone ? [AutofillHints.telephoneNumber]
          : inputType == TextInputType.streetAddress ? [AutofillHints.fullStreetAddress]
          : inputType == TextInputType.url ? [AutofillHints.url]
          : inputType == TextInputType.visiblePassword ? [AutofillHints.password] : null,
      controller: controller,
      style: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.none,
        color: Color.fromRGBO(0, 0, 0, 1),
      ),
      cursorColor: const Color.fromRGBO(0, 0, 0, 1),
      decoration: InputDecoration(
        isDense: true,
        labelText: labelText,

        suffix: suffixWidget,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: Color.fromRGBO(0, 0, 0, 1),
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color.fromRGBO(214, 214, 214, 1),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(173, 173, 173, 1),
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(173, 173, 173, 1),
          ),
        ),
      ),
    );
  }
}
