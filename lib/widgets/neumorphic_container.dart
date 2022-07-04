import 'package:flutter/material.dart';

import '../configs/configs.dart';

class NeumorphicContainer extends StatelessWidget {
  const NeumorphicContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.shadowOffset = const Offset(4, 4),
    this.shadowBlurRadius = 5,
    this.shadowSpreadRadius = 1,
  });

  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final Offset shadowOffset;
  final double shadowBlurRadius;
  final double shadowSpreadRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.neumorphicShadowLight,
            offset: -shadowOffset,
            blurRadius: shadowBlurRadius,
            spreadRadius: shadowSpreadRadius,
          ),
          BoxShadow(
            color: AppColors.neumorphicShadowDark,
            offset: shadowOffset,
            blurRadius: shadowBlurRadius,
            spreadRadius: shadowSpreadRadius,
          ),
        ],
      ),
      child: child,
    );
  }
}
