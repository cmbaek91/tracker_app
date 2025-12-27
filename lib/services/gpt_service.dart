import 'dart:async';
import '../domain/personal/personal_question.dart';
import '../domain/personal/personal_answer.dart';
import '../domain/result/analysis_result.dart';
import '../error/app_exception.dart';

class GptService {
  Future<AnalysisResult> analyze({
    required List<PersonalQuestion> questions,
    required List<PersonalAnswer> answers,
  }) async {
    if (answers.isEmpty) {
      throw AppException.validation(
        message: '응답 데이터가 비어 있습니다.',
      );
    }

    if (questions.isNotEmpty && questions.length != answers.length) {
      throw AppException.state(
        message: '질문과 응답 개수가 일치하지 않습니다.',
      );
    }

    try {
      await Future.delayed(const Duration(seconds: 1));

      final score = answers.fold<int>(
        0,
        (prev, a) => prev + a.value, // value: int
      );

      final normalized = score / (answers.length * 5);

      return AnalysisResult(
        value: normalized,
        summary: normalized > 0.6
            ? '안정적인 성향'
            : '변동성이 큰 성향',
        createdAt: DateTime.now(),
      );
    } on TimeoutException {
      throw AppException.network(
        message: '분석 요청 시간이 초과되었습니다.',
      );
    } catch (e) {
      throw AppException.unknown(
        message: e.toString(),
      );
    }
  }
}
