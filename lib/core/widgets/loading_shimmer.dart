import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../theme/colors_app.dart';

class LoadingShimmer extends StatelessWidget {
  final Widget child;
  const LoadingShimmer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsApp.shimmer.first,
      highlightColor: ColorsApp.shimmer.last,
      child: child,
    );
  }
}
