import '../personal/personal_answer.dart';
import '../non_personal/non_personal_answer.dart';

class AnalysisResult {
  final PersonalAnswer? personalAnswer;
  final List<NonPersonalAnswer> nonPersonalAnswers;
  final String summary;
  final DateTime createdAt;

  const AnalysisResult({
    required this.personalAnswer,
    required this.nonPersonalAnswers,
    required this.summary,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'personalAnswer': personalAnswer?.toJson(),
      'nonPersonalAnswers':
          nonPersonalAnswers.map((e) => e.toJson()).toList(),
      'summary': summary,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}