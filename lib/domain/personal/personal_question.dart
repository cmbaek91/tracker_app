class PersonalQuestion {
  final String id;
  final String text;

  const PersonalQuestion({
    required this.id,
    required this.text,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
    };
  }

  factory PersonalQuestion.fromJson(Map<String, dynamic> json) {
    return PersonalQuestion(
      id: json['id'] as String,
      text: json['text'] as String,
    );
  }
}
