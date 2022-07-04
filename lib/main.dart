import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'bmi_calculator_app.dart';
import 'configs/configs.dart';

void main() {
  const overlayColor = AppColors.background;
  const systemBarColors = SystemUiOverlayStyle(
    systemNavigationBarColor: overlayColor,
    statusBarColor: overlayColor,
  );
  SystemChrome.setSystemUIOverlayStyle(systemBarColors);

  runApp(
    const ProviderScope(
      child: BmiCalculatorApp(),
    ),
  );
}
