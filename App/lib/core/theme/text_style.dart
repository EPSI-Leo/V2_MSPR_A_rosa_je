import 'package:flutter/material.dart';

class AppTextStyle {
  AppTextStyle({
    this.fontFamily = defaultFontFamily,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
  });

  final String? fontFamily;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;

  static const defaultFontFamily = '.SF Pro Text';

  TextStyle withColor(Color color) => TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      );
}

extension TextStyleExtension on TextStyle {
  TextStyle get normal => copyWith(fontWeight: FontWeight.normal);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w500);
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  TextStyle withOpacity(double opacity) => copyWith(
        color: color?.withOpacity(opacity),
      );
}
