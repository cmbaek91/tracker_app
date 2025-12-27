import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const question = '/question';
  static const result = '/result';

  static final map = <String, WidgetBuilder>{
    splash: (_) => const SplashScreen(),
    login: (_) => const LoginScreen(),
    question: (_) => const QuestionScreen(),
    result: (_) => const ResultScreen(),
  };
}
