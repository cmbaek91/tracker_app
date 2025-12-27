import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const home = '/home';
  static const question = '/question';
  static const result = '/result';

  static Map<String, WidgetBuilder> get map => {
        splash: (_) => const SplashScreen(),
        login: (_) => const LoginScreen(),
        home: (_) => const HomeScreen(),
        question: (_) => const QuestionScreen(),
        result: (_) => const ResultScreen(),
      };
}