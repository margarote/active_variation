import 'package:flutter/material.dart';

import '../consts/app_consts.dart';
import '../theme/colors_app.dart';
import '../theme/text_theme_app.dart';
import 'text_widget.dart';

class ErrorCoreWidget extends StatefulWidget {
  final String message;
  final List<Widget> buttons;

  const ErrorCoreWidget({super.key, required this.message, required this.buttons});

  @override
  State<ErrorCoreWidget> createState() => _ErrorCoreWidgetState();
}

class _ErrorCoreWidgetState extends State<ErrorCoreWidget> {
  final double radius = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SizedBox(
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextWidget(
                        textStyleNum: TextStyleNum.titleLarge,
                        text: AppConsts.error,
                        fontWeightNum: FontWeightNum.w600,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: SizedBox(
                          width: 280,
                          child: TextWidget(
                            textStyleNum: TextStyleNum.headline3,
                            text: AppConsts.messageError + widget.message,
                            fontWeightNum: FontWeightNum.w400,
                            headlineColor: ColorsApp.secoundaryTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: widget.buttons,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
