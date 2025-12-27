import 'package:flutter/material.dart';
import '../state/app_state.dart';
import '../routes.dart';

class SplashScreen extends StatelessWidget {
  final AppState appState;

  const SplashScreen({super.key, required this.appState});

  @override
  Widget build(BuildContext context) {
    final authState = appState.authState;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (authState.isAuthenticated) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.home);
      } else {
        Navigator.of(context).pushReplacementNamed(AppRoutes.login);
      }
    });

    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
