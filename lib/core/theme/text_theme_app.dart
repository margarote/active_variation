import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextThemeApp {
  static TextStyle textTheme(
    TextStyleNum textStyleNum,
    BuildContext context, {
    Color? headlineColor,
    Color? titleColor,
    Color? descriptionColor,
    Color? buttonColor,
    Color? buttonTextColor,
    FontWeightNum? fontWeightNum,
  }) {
    switch (textStyleNum) {
      case TextStyleNum.headline0:
        return GoogleFonts.inter(
          color: headlineColor ?? const Color(0xFF1D1C1C),
          fontSize: 10,
          fontWeight: styledFontWeight(fontWeightNum ?? FontWeightNum.w600),
        );
      case TextStyleNum.headline1:
        return GoogleFonts.inter(
          color: headlineColor ?? const Color(0xFF1D1C1C),
          fontSize: 12,
          fontWeight: styledFontWeight(fontWeightNum ?? FontWeightNum.w600),
        );
      case TextStyleNum.headline2:
        return GoogleFonts.inter(
          color: headlineColor ?? const Color(0xFF1D1C1C),
          fontSize: 14,
          fontWeight: styledFontWeight(fontWeightNum ?? FontWeightNum.w700),
        );
      case TextStyleNum.headline3:
        return GoogleFonts.inter(
          color: headlineColor ?? const Color(0xFF1D1C1C),
          fontSize: 16,
          fontWeight: styledFontWeight(fontWeightNum ?? FontWeightNum.w700),
        );
      case TextStyleNum.headline4:
        return GoogleFonts.inter(
          color: headlineColor ?? const Color(0xFF1D1C1C),
          fontSize: 18,
          fontWeight: styledFontWeight(fontWeightNum ?? FontWeightNum.w700),
        );
      case TextStyleNum.headline5:
        return GoogleFonts.inter(
          color: headlineColor ?? const Color(0xFF1D1C1C),
          fontSize: 20,
          fontWeight: styledFontWeight(fontWeightNum ?? FontWeightNum.w700),
        );
      case TextStyleNum.headline6:
        return GoogleFonts.inter(
          color: headlineColor ?? const Color(0xFF1D1C1C),
          fontSize: 22,
          fontWeight: styledFontWeight(fontWeightNum ?? FontWeightNum.w700),
        );
      case TextStyleNum.headline7:
        return GoogleFonts.inter(
          color: headlineColor ?? const Color(0xFF1D1C1C),
          fontSize: 22,
          fontWeight: styledFontWeight(fontWeightNum ?? FontWeightNum.w400),
        );
      case TextStyleNum.button:
        return GoogleFonts.inter(
          color: buttonColor ?? const Color(0xFF1D1C1C),
          fontSize: 18,
          fontWeight: styledFontWeight(fontWeightNum ?? FontWeightNum.w700),
        );

      case TextStyleNum.titlexLarge:
        return GoogleFonts.inter(
          color: titleColor ?? const Color(0xFF1D1C1C),
          fontSize: 24,
          fontWeight: styledFontWeight(fontWeightNum ?? FontWeightNum.w700),
        );
      case TextStyleNum.titleLarge:
        return GoogleFonts.inter(
          color: titleColor ?? const Color(0xFF1D1C1C),
          fontSize: 28,
          fontWeight: styledFontWeight(fontWeightNum ?? FontWeightNum.w600),
        );
      case TextStyleNum.title:
        return GoogleFonts.inter(
          color: titleColor ?? const Color(0xFF1D1C1C),
          fontSize: 16,
          fontWeight: styledFontWeight(fontWeightNum ?? FontWeightNum.w500),
        );
      case TextStyleNum.titleBold:
        return GoogleFonts.inter(
          color: titleColor ?? const Color(0xFF1D1C1C),
          fontSize: 16,
          fontWeight: styledFontWeight(fontWeightNum ?? FontWeightNum.w700),
        );
      case TextStyleNum.bodyLarge:
        return GoogleFonts.inter(
          color: descriptionColor ?? const Color(0xFF1D1C1C),
          fontSize: 17,
          fontWeight: styledFontWeight(fontWeightNum ?? FontWeightNum.w400),
        );
      case TextStyleNum.bodyMedium:
        return GoogleFonts.inter(
          color: descriptionColor ?? const Color(0xFF1D1C1C),
          fontSize: 15,
          fontWeight: styledFontWeight(fontWeightNum ?? FontWeightNum.w400),
        );

      case TextStyleNum.description:
        return GoogleFonts.inter(
          color: descriptionColor ?? const Color(0xFF1D1C1C),
          fontSize: 15,
          fontWeight: styledFontWeight(fontWeightNum ?? FontWeightNum.w400),
        );
      case TextStyleNum.buttonText:
        return GoogleFonts.inter(
          color: buttonTextColor ?? const Color(0xFF1D1C1C),
          fontSize: 14,
          fontWeight: styledFontWeight(fontWeightNum ?? FontWeightNum.w600),
        );
    }
  }
}

FontWeight styledFontWeight(FontWeightNum fontWeightNum) {
  switch (fontWeightNum) {
    case FontWeightNum.w400:
      return FontWeight.w400;
    case FontWeightNum.w600:
      return FontWeight.w600;
    case FontWeightNum.w700:
      return FontWeight.w700;
    case FontWeightNum.w500:
      return FontWeight.w500;
  }
}

enum TextStyleNum {
  headline0,
  headline1,
  headline2,
  headline3,
  headline4,
  headline5,
  headline6,
  headline7,
  button,
  titlexLarge,
  titleLarge,
  title,
  titleBold,
  bodyLarge,
  bodyMedium,
  description,
  buttonText,
}

enum FontWeightNum {
  w700,
  w600,
  w500,
  w400,
}
