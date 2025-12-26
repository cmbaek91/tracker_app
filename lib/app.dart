import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

class TrackerApp extends StatelessWidget {
  const TrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tracker',
      home: const HomeScreen(),
    );
  }
}
