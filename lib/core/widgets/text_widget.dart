import 'package:flutter/material.dart';

import '../theme/text_theme_app.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextStyleNum textStyleNum;
  final Color? buttonTextColor;
  final Color? buttonColor;
  final Color? descriptionColor;
  final Color? headlineColor;
  final Color? titleColor;
  final TextAlign? textAlign;
  final int? maxLines;
  final FontWeightNum? fontWeightNum;
  final TextOverflow? textOverflow;
  const TextWidget({
    Key? key,
    required this.textStyleNum,
    this.buttonTextColor,
    this.descriptionColor,
    this.headlineColor,
    this.titleColor,
    this.textAlign,
    required this.text,
    this.maxLines,
    this.buttonColor,
    this.fontWeightNum,
    this.textOverflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextThemeApp.textTheme(
        textStyleNum,
        context,
        descriptionColor: descriptionColor,
        headlineColor: headlineColor,
        titleColor: titleColor,
        buttonColor: buttonColor,
        buttonTextColor: buttonTextColor,
        fontWeightNum: fontWeightNum,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: textOverflow,
    );
  }
}
