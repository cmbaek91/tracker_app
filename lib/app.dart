import 'package:flutter/material.dart';
import 'routes.dart';

class TrackerApp extends StatelessWidget {
  const TrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tracker',
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}
