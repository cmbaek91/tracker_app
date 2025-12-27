import 'package:flutter/foundation.dart';
import '../domain/personal/personal_question.dart';
import '../domain/personal/personal_answer.dart';
import '../domain/result/analysis_result.dart';
import '../services/gpt_service.dart';
import '../error/app_exception.dart';

enum QuestionFlowStatus {
  idle,
  answering,
  submitting,
  completed,
  error,
}

class QuestionState extends ChangeNotifier {
  final GptService _gptService;

  QuestionState(this._gptService);

  QuestionFlowStatus _status = QuestionFlowStatus.idle;
  PersonalQuestion? _currentQuestion;
  PersonalAnswer? _answer;
  AnalysisResult? _result;
  AppException? _error;

  QuestionFlowStatus get status => _status;
  PersonalQuestion? get currentQuestion => _currentQuestion;
  PersonalAnswer? get answer => _answer;
  AnalysisResult? get result => _result;
  AppException? get error => _error;

  bool get canAnswer => _status == QuestionFlowStatus.answering;
  bool get isSubmitting => _status == QuestionFlowStatus.submitting;
  bool get isCompleted => _status == QuestionFlowStatus.completed;

  void start(PersonalQuestion question) {
    _currentQuestion = question;
    _answer = null;
    _result = null;
    _error = null;
    _status = QuestionFlowStatus.answering;
    notifyListeners();
  }

  void updateAnswer(String value) {
    if (_status != QuestionFlowStatus.answering) return;
    _answer = PersonalAnswer(value);
    notifyListeners();
  }

  Future<void> submit() async {
    if (_currentQuestion == null || _answer == null) return;

    try {
      _status = QuestionFlowStatus.submitting;
      _error = null;
      notifyListeners();

      final analysis = await _gptService.analyze(
        question: _currentQuestion!,
        answer: _answer!,
      );

      _result = analysis;
      _status = QuestionFlowStatus.completed;
    } catch (e) {
      _error = AppException.from(e);
      _status = QuestionFlowStatus.error;
    }
    notifyListeners();
  }

  void reset() {
    _currentQuestion = null;
    _answer = null;
    _result = null;
    _error = null;
    _status = QuestionFlowStatus.idle;
    notifyListeners();
  }
}