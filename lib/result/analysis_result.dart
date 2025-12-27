import '../personal/personal_answer.dart';
import '../../error/app_exception.dart';

class AnalysisResult {
  final String summary;
  final double score;
  final DateTime analyzedAt;

  const AnalysisResult({
    required this.summary,
    required this.score,
    required this.analyzedAt,
  });

  factory AnalysisResult.fromAnswers(List<PersonalAnswer> answers) {
    if (answers.isEmpty) {
      throw AppException.validation('분석할 답변이 없습니다.');
    }

    double total = 0;
    for (final a in answers) {
      total += a.numericValue;
    }

    final normalizedScore = (total / answers.length).clamp(0, 100).toDouble();

    return AnalysisResult(
      summary: _buildSummary(normalizedScore),
      score: normalizedScore,
      analyzedAt: DateTime.now(),
    );
  }

  static String _buildSummary(double score) {
    if (score >= 80) {
      return '전반적으로 매우 안정적인 성향입니다.';
    } else if (score >= 50) {
      return '균형 잡힌 성향을 보입니다.';
    } else {
      return '변화와 관리가 필요한 성향입니다.';
    }
  }
}
