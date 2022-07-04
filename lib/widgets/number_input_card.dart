import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../configs/configs.dart';
import 'animations.dart';
import 'widgets.dart';

final _animationDirectionProvider = StateProvider<AxisDirection>((ref) {
  return AxisDirection.right;
});

class NumberInputCard extends StatelessWidget {
  const NumberInputCard({
    super.key,
    required this.label,
    required this.value,
    this.unit,
    required this.maxValueValidation,
    required this.minValueValidation,
    required this.onAddButtonPressed,
    required this.onMinusButtonPressed,
  });

  final String label;
  final String value;
  final String? unit;
  final bool Function() maxValueValidation;
  final bool Function() minValueValidation;
  final void Function() onAddButtonPressed;
  final void Function() onMinusButtonPressed;

  @override
  Widget build(BuildContext context) {
    return NeumorphicContainer(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildLabel(context), _buildMiddle(context), _buildButtons()],
      ),
    );
  }

  Widget _buildLabel(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: AppColors.grey,
          ),
    );
  }

  Row _buildMiddle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildValue(context),
        if (unit != null) _buildUnit(context),
      ],
    );
  }

  Row _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildAddButton(),
        _buildMinusButton(),
      ],
    );
  }

  Widget _buildValue(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 100),
      transitionBuilder: (child, animation) {
        return Consumer(builder: (context, ref, _) {
          return MySlideFadeTransition(
            animation: animation,
            direction: ref.watch(_animationDirectionProvider),
            child: child,
          );
        });
      },
      child: Text(
        key: ValueKey(value),
        value,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 36),
      ),
    );
  }

  Widget _buildUnit(BuildContext context) {
    return Text(
      ' $unit',
      style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 36),
    );
  }

  Widget _buildMinusButton() {
    return Consumer(
      builder: (context, ref, _) {
        return NeumorphicCircleButton(
          icon: FontAwesomeIcons.minus,
          onPressed: minValueValidation() == false
              ? null
              : () {
                  if (ref.read(_animationDirectionProvider) == AxisDirection.left) {
                    ref.read(_animationDirectionProvider.notifier).state = AxisDirection.right;
                  }

                  onMinusButtonPressed();
                },
        );
      },
    );
  }

  Widget _buildAddButton() {
    return Consumer(
      builder: (context, ref, _) {
        return NeumorphicCircleButton(
          icon: FontAwesomeIcons.plus,
          onPressed: maxValueValidation() == false
              ? null
              : () {
                  if (ref.read(_animationDirectionProvider) == AxisDirection.right) {
                    ref.read(_animationDirectionProvider.notifier).state = AxisDirection.left;
                  }

                  onAddButtonPressed();
                },
        );
      },
    );
  }
}
