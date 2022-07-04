import 'package:flutter/material.dart';

class MySlideFadeTransition extends AnimatedWidget {
  MySlideFadeTransition({
    super.key,
    required Animation<double> animation,
    this.transformHitTests = true,
    this.direction = AxisDirection.right,
    required this.child,
  }) : super(listenable: animation) {
    switch (direction) {
      case AxisDirection.up:
        _tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
        break;
      case AxisDirection.right:
        _tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        break;
      case AxisDirection.down:
        _tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
        break;
      case AxisDirection.left:
        _tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        break;
    }
  }

  final bool transformHitTests;
  final Widget child;
  final AxisDirection direction;
  late final Tween<Offset> _tween;

  Animation<double> get animation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    final offset = _tween.evaluate(animation);

    final isReversed = animation.status == AnimationStatus.reverse;

    return SlideTransition(
      position: Tween<Offset>(
        begin: isReversed ? -offset : offset,
        end: Offset.zero,
      ).animate(animation),
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
}
