import 'package:flutter/material.dart';

import '../../../../core/consts/app_consts.dart';
import '../../../../core/inject/inject_container.dart';
import '../../../../core/theme/colors_app.dart';
import '../../../../core/widgets/button_closed_app.dart';
import '../../../../core/widgets/button_widget.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/loading_shimmer.dart';
import '../../../../routes/route_names.dart';
import '../controller/splash_controller.dart';
import '../states/splash_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashController _splashController;

  @override
  void initState() {
    _splashController = sl<SplashController>();

    _splashController.isConnectedInternet();

    _splashController.addListener(
      () {
        if (_splashController.value is SuccessSplashState) {
          if (mounted) {
            Navigator.pushNamedAndRemoveUntil(context, RouteNames.variation, (route) => false);
          }
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.background,
      body: SafeArea(
        child: ValueListenableBuilder<SplashState>(
            valueListenable: _splashController,
            builder: (context, state, child) {
              switch (state.runtimeType) {
                case InitialSplashState:
                case LoadingSplashState:
                  return const Center(
                    child: LoadingShimmer(
                      child: Icon(
                        Icons.graphic_eq_rounded,
                        size: 120,
                      ),
                    ),
                  );
                case ErrorSplashState:
                  final message = (_splashController.value as ErrorSplashState).message;
                  return ErrorCoreWidget(
                    message: message,
                    buttons: [
                      _button(),
                      const SizedBox(
                        height: 18,
                      ),
                      const ButtonClosedApp(),
                    ],
                  );
                default:
                  return Container();
              }
            }),
      ),
    );
  }

  Widget _button() {
    return ButtonWidget(
      onTap: () {
        _splashController.isConnectedInternet();
      },
      text: AppConsts.tryAgain,
      secoundaryButton: true,
      icon: Icons.refresh_rounded,
    );
  }
}
