import 'package:flutter/material.dart';

import '../theme/colors_app.dart';
import '../theme/text_theme_app.dart';
import 'text_widget.dart';

void snackbarCustom(BuildContext context, String message, {bool isError = false}) {
  if (message.isNotEmpty && message.length > 5) {
    ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? onTap;

    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 4),
      padding: const EdgeInsets.only(left: 16, right: 16),
      backgroundColor: Colors.transparent,
      content: Stack(
        children: [
          Positioned(
            bottom: 80,
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: isError ? ColorsApp.error : (ColorsApp.primary),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 150,
                    child: TextWidget(
                      textStyleNum: TextStyleNum.headline2,
                      text: message,
                      headlineColor: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      onTap?.close();
                    },
                    icon: const Icon(
                      Icons.cancel,
                      color: Colors.white,
                    ),
                    iconSize: 24,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    if (ScaffoldMessenger.of(context).mounted) {
      ScaffoldMessenger.of(context).clearMaterialBanners();
      ScaffoldMessenger.of(context).clearSnackBars();
      onTap = ScaffoldMessenger.of(context).showSnackBar(
        snackBar,
      );
    }
  }
}
