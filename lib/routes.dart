import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';
import 'state/app_state.dart';
import 'domain/personal/personal_answer.dart';

class AppRoutes {
  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        final appState = settings.arguments as AppState;
        return MaterialPageRoute(
          builder: (_) => SplashScreen(appState: appState),
        );

      case '/login':
        final appState = settings.arguments as AppState;
        return MaterialPageRoute(
          builder: (_) => LoginScreen(appState: appState),
        );

      case '/question':
        return MaterialPageRoute(
          builder: (_) => const QuestionScreen(),
        );

      case '/result':
        final answers = settings.arguments as List<PersonalAnswer>;
        return MaterialPageRoute(
          builder: (_) => ResultScreen(answers: answers),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Unknown route')),
          ),
        );
    }
  }
}
