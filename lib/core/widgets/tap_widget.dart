import 'package:flutter/material.dart';

import '../theme/colors_app.dart';
import 'ripple_widget.dart';

class TapWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final double? radius;
  final Widget child;
  final bool? isOver;
  const TapWidget({
    Key? key,
    required this.child,
    this.isOver,
    this.onTap,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StyledRippleEffect(
      isOver: isOver ?? true,
      onTap: onTap,
      splashColor: ColorsApp.background,
      radius: radius,
      child: child,
    );
  }
}
