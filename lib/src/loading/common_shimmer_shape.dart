import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CommonShimmerShape extends StatelessWidget {
  final double? width;
  final double? height;
  final ShapeBorder shapeBorder;
  final EdgeInsetsGeometry? margin;
  final Widget? childWidget;

  const CommonShimmerShape.rectangular({
    super.key,
    this.width,
    this.height,
    this.margin,
    this.childWidget,
  }) : shapeBorder = const RoundedRectangleBorder();

  const CommonShimmerShape.circular({
    super.key,
    required this.width,
    required this.height,
    this.margin,
    this.childWidget,
  }) : shapeBorder = const CircleBorder();

  const CommonShimmerShape.square({
    super.key,
    required double dimension,
    this.margin,
    this.childWidget,
  }) : width = dimension,
       height = dimension,
       shapeBorder = const RoundedRectangleBorder();

  const CommonShimmerShape.custom({
    super.key,
    this.width,
    this.height,
    this.margin,
    this.childWidget,
  }) : shapeBorder = const RoundedRectangleBorder();

  Color get _getBaseColor => Colors.grey.shade300;

  Color get _getHighlightColor => Colors.grey.shade100;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Shimmer.fromColors(
        baseColor: _getBaseColor,
        highlightColor: _getHighlightColor,
        child:
            childWidget ??
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Container(
                width: width,
                height: height,
                decoration: ShapeDecoration(
                  color: _getHighlightColor,
                  shape: shapeBorder,
                ),
              ),
            ),
      ),
    );
  }
}
