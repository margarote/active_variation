import 'package:flutter/material.dart';

import '../core/screen/error_screen.dart';
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
  return _getPageRoute(const ErrorScreen(), settings);
}
