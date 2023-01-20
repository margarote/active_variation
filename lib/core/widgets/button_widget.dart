import 'package:flutter/material.dart';

import '../theme/colors_app.dart';
import '../theme/text_theme_app.dart';
import 'tap_widget.dart';
import 'text_widget.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool secoundaryButton;
  final IconData? icon;
  final double? width;
  final double? height;
  final TextStyleNum? textStyleNum;
  const ButtonWidget(
      {super.key,
      required this.onTap,
      required this.text,
      required this.secoundaryButton,
      this.icon,
      this.width,
      this.height,
      this.textStyleNum});

  @override
  Widget build(BuildContext context) {
    final colorText = secoundaryButton ? ColorsApp.textColor : ColorsApp.textColorDark;
    return TapWidget(
      isOver: true,
      radius: 50,
      onTap: onTap,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: secoundaryButton ? ColorsApp.secoundaryBackgroundButtonColor : ColorsApp.backgroundButtonColor,
        ),
        child: Visibility(
          visible: icon == null,
          replacement: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 24, color: colorText),
              const SizedBox(
                width: 8,
              ),
              _text(colorText),
            ],
          ),
          child: Center(
            child: _text(colorText),
          ),
        ),
      ),
    );
  }

  Widget _text(Color colorText) {
    return TextWidget(
      textStyleNum: textStyleNum ?? TextStyleNum.headline3,
      text: text,
      fontWeightNum: FontWeightNum.w600,
      headlineColor: colorText,
    );
  }
}
