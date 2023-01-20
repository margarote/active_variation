import 'package:flutter/material.dart';

import '../theme/colors_app.dart';
import '../theme/text_theme_app.dart';
import 'tap_widget.dart';
import 'text_widget.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const TextButtonWidget({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TapWidget(
      onTap: onTap,
      isOver: true,
      radius: 8,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: TextWidget(
          textStyleNum: TextStyleNum.headline3,
          text: text,
          headlineColor: ColorsApp.primary,
          fontWeightNum: FontWeightNum.w600,
        ),
      ),
    );
  }
}
