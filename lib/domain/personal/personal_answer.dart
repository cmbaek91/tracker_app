class PersonalAnswer {
  final String questionId;
  final String value;
  final DateTime answeredAt;

  PersonalAnswer({
    required this.questionId,
    required this.value,
    required this.answeredAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'questionId': questionId,
      'value': value,
      'answeredAt': answeredAt.toIso8601String(),
    };
  }

  factory PersonalAnswer.fromJson(Map<String, dynamic> json) {
    return PersonalAnswer(
      questionId: json['questionId'] as String,
      value: json['value'] as String,
      answeredAt: DateTime.parse(json['answeredAt'] as String),
    );
  }
}
