import 'package:flutter/material.dart';

import '../configs/configs.dart';
import 'widgets.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    required this.title,
    required this.leftIcon,
    required this.leftIconOnPressed,
    required this.rightIcon,
    required this.rightIconOnPressed,
  });

  final String title;
  final IconData leftIcon;
  final void Function() leftIconOnPressed;
  final IconData rightIcon;
  final void Function() rightIconOnPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NeumorphicCircleButton(
          icon: leftIcon,
          onPressed: leftIconOnPressed,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.grey,
              ),
        ),
        NeumorphicCircleButton(
          icon: rightIcon,
          onPressed: rightIconOnPressed,
        ),
      ],
    );
  }
}
