import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../barrels/resources.dart';

class TextStyles {

  TextStyles._();

  static TextStyle get appbarTitleStyle => GoogleFonts.getFont(
    'Roboto',
    fontWeight: FontWeight.w700,
    fontSize: 22.6,
    color: kDarkBlue,
  );

  static TextStyle get headlineStyle => GoogleFonts.getFont(
    'Roboto',
    fontWeight: FontWeight.w700,
    fontSize: 25,
    color: kBlack,
  );

  static TextStyle get hintStyle => GoogleFonts.getFont(
    'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 17.4,
    letterSpacing: 0.2,
    color: kSilverGrey,
  );

  static TextStyle get buttonTextStyle => GoogleFonts.getFont(
    'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 17,
    letterSpacing: 0.2,
    color: kWhite,
  );

  static TextStyle get errorStyle => GoogleFonts.getFont(
    'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 13,
    letterSpacing: 0.2,
    color: kRedOrange,
  );

  static TextStyle get productTitleStyle => GoogleFonts.getFont(
    'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 13.9,
    letterSpacing: 0.1,
    color: kBlack,
  );

  static TextStyle get productInfoStyle => GoogleFonts.getFont(
    'Lato',
    fontWeight: FontWeight.w400,
    fontSize: 15,
    letterSpacing: 0.1,
    color: kSantaGrey,
    decorationColor: kSantaGrey,
  );

  static TextStyle get productPriceStyle => GoogleFonts.getFont(
    'Roboto',
    fontWeight: FontWeight.w700,
    fontSize: 18,
    letterSpacing: 0.2,
    color: kBlack,
  );

  static TextStyle get filterTextStyle => GoogleFonts.getFont(
    'Lato',
    fontWeight: FontWeight.w400,
    fontSize: 15.6,
    letterSpacing: 0.1,
    color: kOsloGrey,
  );

  static TextStyle get accountInfoTextStyle => GoogleFonts.getFont(
    'Lato',
    fontWeight: FontWeight.w900,
    fontSize: 24,
    letterSpacing: 0.2,
    color: kBlack,
  );

  static TextStyle get accountTextFieldTitleStyle => GoogleFonts.getFont(
    'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.1,
    color: kDarkGrey,
  );

  static TextStyle get accountUpdateButtonStyle => GoogleFonts.getFont(
    'Lato',
    fontWeight: FontWeight.w700,
    fontSize: 17.4,
    letterSpacing: 0.2,
  );
}