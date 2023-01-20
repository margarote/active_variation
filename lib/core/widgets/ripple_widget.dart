import 'package:flutter/material.dart';

class StyledRippleEffect extends StatelessWidget {
  final Color? splashColor;
  final Widget child;
  final VoidCallback? onTap;
  final bool isOver;
  final double? radius;
  const StyledRippleEffect(
      {required this.child, this.onTap, this.splashColor, this.isOver = false, this.radius, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isOver) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 30),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            child,
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(onTap: onTap, splashColor: splashColor),
              ),
            )
          ],
        ),
      );
    } else {
      return Material(
        color: Colors.transparent,
        child: InkWell(onTap: onTap, splashColor: splashColor, child: child),
      );
    }
  }
}
