
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'constants.dart';

Widget regularBodyText({
  required String text,
  double bottomPadding = 0.0,
  double? fontSize,
  Color color = defaultLightBlack,
  double leftPadding = 0.0,
  double rightPadding = 0.0,
  double topPadding = 0.0,
  TextAlign textAlign = TextAlign.start,
  int maxLines = 100,
}) {
  return Padding(
    padding: EdgeInsets.only(
      bottom: bottomPadding,
      left: leftPadding,
      top: topPadding,
      right: rightPadding,
    ),
    child: Text(
      text,
      textAlign: textAlign,
      style: textStyleRegularStyle(
        fontSize: fontSize ?? 16,
        textColor: color,
      ),
      maxLines: maxLines,
    ),
  );
}

Widget mediumBodyText(
    {required String text,
    double bottomPadding = 0.0,
    double? fontSize,
    Color color = defaultLightBlack,
    TextAlign textAlign = TextAlign.start,
    double leftPadding = 0.0,
    double rightPadding = 0.0,
    double topPadding = 0.0}) {
  return Padding(
    padding: EdgeInsets.only(
      bottom: bottomPadding,
      left: leftPadding,
      top: topPadding,
      right: rightPadding,
    ),
    child: Text(
      text,
      textAlign: textAlign,
      style: textStyleMediumStyle(
        fontSize: fontSize ?? 16,
        textColor: color,
      ),
    ),
  );
}

Widget boldBodyText({
  required String text,
  double bottomPadding = 0.0,
  double? fontSize,
  Color color = defaultLightBlack,
  double leftPadding = 0.0,
  double rightPadding = 0.0,
  topPadding = 0.0,
}) {
  return Padding(
    padding: EdgeInsets.only(
      bottom: bottomPadding,
      left: leftPadding,
      top: topPadding,
      right: rightPadding,
    ),
    child: Text(
      text,
      style: textStyleBoldStyle(
        fontSize: fontSize ?? 16,
        textColor: color,
      ),
    ),
  );
}

//Text style
TextStyle? textStyleRegularStyle({
  Color textColor = defaultLightBlack,
  double? fontSize,
}) {
  return TextStyle(
      color: textColor, fontSize: fontSize ?? 16, fontFamily: fontRegular);
}

TextStyle? textStyleMediumStyle({
  Color textColor = defaultLightBlack,
  double? fontSize,
}) {
  return TextStyle(
      color: textColor, fontSize: fontSize ?? 16, fontFamily: fontMedium);
}

TextStyle? textStyleBoldStyle({
  Color textColor = defaultLightBlack,
  double? fontSize,
}) {
  return TextStyle(
      color: textColor, fontSize: fontSize ?? 16, fontFamily: fontBold);
}
