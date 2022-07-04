import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'configs/configs.dart';

class BmiCalculatorApp extends StatelessWidget {
  const BmiCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bmi Calculator',
      theme: _buildTheme(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }

  ThemeData _buildTheme() {
    final baseTheme = ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: const Color(0xff58cae4),
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme),
    );
  }
}
