import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../configs/configs.dart';

class NeumorphicCircleButton extends HookWidget {
  const NeumorphicCircleButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.shadowOffset = const Offset(4, 4),
    this.shadowBlurRadius = 5,
    this.shadowSpreadRadius = 1,
  });

  final IconData icon;
  final void Function()? onPressed;
  final Offset shadowOffset;
  final double shadowBlurRadius;
  final double shadowSpreadRadius;

  @override
  Widget build(BuildContext context) {
    final isPressed = useState(false);

    return Listener(
      onPointerUp: (_) => isPressed.value = false,
      onPointerDown: (_) => isPressed.value = true,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.background,
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
        child: IconButton(
          color: AppColors.grey,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: FaIcon(icon),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
