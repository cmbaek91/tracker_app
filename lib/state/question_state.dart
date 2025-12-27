import 'package:flutter/foundation.dart';
import '../domain/personal/personal_question.dart';
import '../domain/personal/personal_answer.dart';
import '../error/app_exception.dart';

class QuestionState extends ChangeNotifier {
  final List<PersonalQuestion> _questions;
  final List<PersonalAnswer> _answers = [];

  int _currentIndex = 0;
  bool _isSubmitting = false;
  AppException? _error;

  QuestionState({
    required List<PersonalQuestion> questions,
  }) : _questions = questions {
    if (_questions.isEmpty) {
      throw AppException.state('질문 목록은 비어 있을 수 없습니다.');
    }
  }

  int get currentIndex => _currentIndex;
  int get totalCount => _questions.length;
  bool get isSubmitting => _isSubmitting;
  AppException? get error => _error;

  bool get isCompleted => _currentIndex >= _questions.length;

  PersonalQuestion? get currentQuestion =>
      isCompleted ? null : _questions[_currentIndex];

  List<PersonalAnswer> get answers => List.unmodifiable(_answers);

  void submitAnswer(String value) {
    if (isCompleted) {
      _error = AppException.state('이미 모든 질문이 완료되었습니다.');
      notifyListeners();
      return;
    }

    if (value.trim().isEmpty) {
      _error = AppException.validation('답변은 비어 있을 수 없습니다.');
      notifyListeners();
      return;
    }

    _isSubmitting = true;
    notifyListeners();

    try {
      final question = _questions[_currentIndex];
      _answers.add(
        PersonalAnswer(
          questionId: question.id,
          value: value,
          answeredAt: DateTime.now(),
        ),
      );
      _currentIndex++;
      _error = null;
    } catch (e) {
      _error = AppException.unknown(e.toString());
    } finally {
      _isSubmitting = false;
      notifyListeners();
    }
  }
}
