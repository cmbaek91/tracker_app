import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'state/app_state.dart';
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

  // app.dart 에서 직접 참조하는 고정 entry
  static final Map<String, WidgetBuilder> map = {
    splash: (context) {
      final appState = context.read<AppState>();
      return SplashScreen(appState: appState);
    },
    login: (context) {
      final appState = context.read<AppState>();
      return LoginScreen(appState: appState);
    },
    home: (_) => const HomeScreen(),
    question: (_) => const QuestionScreen(),
    result: (context) {
      final answers =
          ModalRoute.of(context)!.settings.arguments as Map<int, String>;
      return ResultScreen(answers: answers);
    },
  };
}