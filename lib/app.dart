import 'package:flutter/material.dart';
import 'routes.dart';
import 'theme/app_theme.dart';

class TrackerApp extends StatelessWidget {
  const TrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracker',
      theme: AppTheme.light(),
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.map,
    );
  }
}