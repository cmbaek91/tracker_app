class PersonalQuestion {
  final String id;
  final String title;
  final String description;
  final bool requiresTextInput;

  const PersonalQuestion({
    required this.id,
    required this.title,
    required this.description,
    required this.requiresTextInput,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'requiresTextInput': requiresTextInput,
    };
  }

  factory PersonalQuestion.fromJson(Map<String, dynamic> json) {
    return PersonalQuestion(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      requiresTextInput: json['requiresTextInput'] as bool,
    );
  }
}