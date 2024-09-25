// regular style

import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color,
    {TextDecoration? textDecoration, FontStyle? fontStyle}) {
  return TextStyle(
      decoration: textDecoration,
      fontStyle: fontStyle,
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight);
}
// regular style

TextStyle? getLightStyle({required Color color, double? fontSize}) {
  return _getTextStyle(fontSize ?? FontSize.s12, FontConstants.fontFamily,
      FontWeightManager.light, color);
}

TextStyle? getRegularStyle({required Color color, double? fontSize}) {
  return _getTextStyle(fontSize ?? FontSize.s12, FontConstants.fontFamily,
      FontWeightManager.regular, color);
}

TextStyle? getRegularItalicStyle({required Color color, double? fontSize}) {
  return _getTextStyle(fontSize ?? FontSize.s12, FontConstants.fontFamily,
      FontWeightManager.regular, color,
      fontStyle: FontStyle.italic);
}
// medium text style

TextStyle? getMediumStyle({double? fontSize, required Color color}) {
  return _getTextStyle(fontSize ?? FontSize.s12, FontConstants.fontFamily,
      FontWeightManager.medium, color);
}

TextStyle? getSemiBoldStyle({double? fontSize, required Color color}) {
  return _getTextStyle(fontSize ?? FontSize.s14, FontConstants.fontFamily,
      FontWeightManager.semiBold, color);
}

TextStyle? getBoldStyle({double? fontSize, required Color color}) {
  return _getTextStyle(fontSize ?? FontSize.s14, FontConstants.fontFamily,
      FontWeightManager.bold, color);
}

TextStyle? getSemiBoldUnderLineStyle({double? fontSize, required Color color}) {
  return _getTextStyle(fontSize ?? FontSize.s14, FontConstants.fontFamily,
      FontWeightManager.semiBold, color,
      textDecoration: TextDecoration.underline);
}
