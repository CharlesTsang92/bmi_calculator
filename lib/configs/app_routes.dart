import 'package:flutter/material.dart';

import '../pages/pages.dart';

class AppRoutes {
  AppRoutes._();

  static const String home = '/';
  static const String result = '/result';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case result:
        return MaterialPageRoute(builder: (_) => const ResultPage());
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
