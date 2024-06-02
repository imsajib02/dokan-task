import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {

  TextStyles._();

  static TextStyle get appbarTitleStyle => GoogleFonts.getFont(
    'Roboto',
    fontWeight: FontWeight.w700,
    fontSize: 22.6,
    color: Color(0xFF222455),
  );

  static TextStyle get headlineStyle => GoogleFonts.getFont(
    'Roboto',
    fontWeight: FontWeight.w700,
    fontSize: 25,
    color: Color(0xFF000000),
  );

  static TextStyle get hintStyle => GoogleFonts.getFont(
    'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 17.4,
    letterSpacing: 0.2,
    color: Color(0xFFA4A9AF),
  );

  static TextStyle get buttonTextStyle => GoogleFonts.getFont(
    'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 17,
    letterSpacing: 0.2,
    color: Color(0xFFFFFFFF),
  );

  static TextStyle get errorStyle => GoogleFonts.getFont(
    'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 13,
    letterSpacing: 0.2,
    color: Colors.redAccent,
  );
}