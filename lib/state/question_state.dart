import '../domain/personal/personal_answer.dart';

/// ❗ 질문 진행 중 상태
/// 아직 저장하지 않는다 (in-memory only)
class QuestionState {
  PersonalAnswer? answer;

  void setAnswer(String input) {
    answer = PersonalAnswer(input);
  }

  void clear() {
    answer = null;
  }
}
