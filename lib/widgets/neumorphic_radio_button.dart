import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../configs/app_colors.dart';
import 'widgets.dart';

class NeumorphicRadioButton<T> extends StatelessWidget {
  const NeumorphicRadioButton({
    super.key,
    required this.icon,
    required this.value,
    required this.groupValue,
    required this.onPressed,
    this.activeColor,
  });

  final IconData icon;
  final T value;
  final T groupValue;
  final void Function(T value) onPressed;
  final Color? activeColor;

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;
    return NeumorphicButton(
      onPressed: () {
        onPressed(value);
      },
      child: FaIcon(
        icon,
        color: isSelected ? activeColor : AppColors.grey,
      ),
    );
  }
}
