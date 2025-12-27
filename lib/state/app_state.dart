import 'package:flutter/foundation.dart';
import 'auth_state.dart';
import 'question_state.dart';

class AppState extends ChangeNotifier {
  final AuthState authState;
  final QuestionState questionState;

  AppState({
    required this.authState,
    required this.questionState,
  }) {
    authState.addListener(_onSubStateChanged);
    questionState.addListener(_onSubStateChanged);
  }

  void _onSubStateChanged() {
    notifyListeners();
  }

  bool get isReady => authState.isInitialized;

  @override
  void dispose() {
    authState.removeListener(_onSubStateChanged);
    questionState.removeListener(_onSubStateChanged);
    super.dispose();
  }
}