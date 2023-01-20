import 'package:flutter/material.dart';

import '../consts/app_consts.dart';
import '../inject/inject_container.dart';
import '../usecases/closed_app.dart';
import 'text_button_widget.dart';

class ButtonClosedApp extends StatelessWidget {
  const ButtonClosedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButtonWidget(
      onTap: () async {
        await sl<ClosedApp>().call();
      },
      text: AppConsts.closedApp,
    );
  }
}
