import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/sample_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String sample = '/sample';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
    sample: (context) => const SampleScreen(),
  };
}
