class NonPersonalAnswer {
  final String eventKey;
  final String value;
  final DateTime recordedAt;

  const NonPersonalAnswer({
    required this.eventKey,
    required this.value,
    required this.recordedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'eventKey': eventKey,
      'value': value,
      'recordedAt': recordedAt.toIso8601String(),
    };
  }

  factory NonPersonalAnswer.fromJson(Map<String, dynamic> json) {
    return NonPersonalAnswer(
      eventKey: json['eventKey'] as String,
      value: json['value'] as String,
      recordedAt: DateTime.parse(json['recordedAt'] as String),
    );
  }
}