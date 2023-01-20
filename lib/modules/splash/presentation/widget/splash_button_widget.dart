import 'package:flutter/material.dart';

import '../../../../core/theme/colors_app.dart';
import '../../../../core/theme/text_theme_app.dart';
import '../../../../core/widgets/tap_widget.dart';
import '../../../../core/widgets/text_widget.dart';

class SplashWidgetButton extends StatelessWidget {
  const SplashWidgetButton({super.key});

  final double radius = 8;

  @override
  Widget build(BuildContext context) {
    return TapWidget(
      isOver: true,
      radius: radius,
      onTap: () {},
      child: Container(
        width: 150,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: ColorsApp.primary,
        ),
        child: Center(
          child: TextWidget(
            textStyleNum: TextStyleNum.headline2,
            text: "Tentar novamente",
            fontWeightNum: FontWeightNum.w600,
            headlineColor: ColorsApp.textColorDark,
          ),
        ),
      ),
    );
  }
}
