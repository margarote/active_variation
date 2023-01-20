import 'package:flutter/material.dart';
import '../core/consts/app_consts.dart';

import '../core/widgets/button_closed_app.dart';
import '../core/widgets/error_widget.dart';
import '../modules/splash/presentation/screen/splash_screen.dart';
import '../modules/variation/presentation/screen/variation_screen.dart';
import 'effect_fade_route.dart';
import 'route_names.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteNames.splash:
      return _getPageRoute(const SplashScreen(), settings);
    case RouteNames.variation:
      return _getPageRoute(const VariationScreen(), settings);
    default:
      return onUnknownRoute(settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return EffectFadeRoute(child, settings.name);
}

Route<dynamic>? onUnknownRoute(RouteSettings settings) {
  return _getPageRoute(
      const ErrorCoreWidget(
        message: AppConsts.errorNotFoundPage,
        buttons: [ButtonClosedApp()],
      ),
      settings);
}
