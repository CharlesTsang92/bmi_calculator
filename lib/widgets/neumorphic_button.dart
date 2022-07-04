import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../configs/configs.dart';

class NeumorphicButton extends HookWidget {
  const NeumorphicButton({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.shadowOffset = const Offset(4, 4),
    this.shadowBlurRadius = 5,
    this.shadowSpreadRadius = 1,
    this.gradient,
    required this.onPressed,
  });

  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final Offset shadowOffset;
  final double shadowBlurRadius;
  final double shadowSpreadRadius;
  final Gradient? gradient;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final isPressed = useState(false);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Listener(
          onPointerUp: (event) {
            isPressed.value = false;
            if (_isPointerInside(constraints, event)) {
              onPressed();
            }
          },
          onPointerDown: (_) => isPressed.value = true,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            width: width,
            height: height,
            padding: padding,
            decoration: BoxDecoration(
              color: AppColors.background,
              gradient: gradient,
              borderRadius: BorderRadius.circular(12),
              boxShadow: isPressed.value
                  ? null
                  : [
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
            child: Center(
              child: child,
            ),
          ),
        );
      },
    );
  }

  bool _isPointerInside(BoxConstraints constraints, PointerUpEvent event) =>
      event.localPosition.dx >= 0.0 &&
      event.localPosition.dy >= 0.0 &&
      event.localPosition.dx <= constraints.maxWidth &&
      event.localPosition.dy <= constraints.maxHeight;
}
