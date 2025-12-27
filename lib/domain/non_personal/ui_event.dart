
enum UiEventType {
  screenView,
  buttonClick,
  error,
}

class UiEvent {
  final UiEventType type;
  final String name;
  final Map<String, dynamic> parameters;
  final DateTime occurredAt;

  const UiEvent({
    required this.type,
    required this.name,
    required this.parameters,
    required this.occurredAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type.name,
      'name': name,
      'parameters': parameters,
      'occurredAt': occurredAt.toIso8601String(),
    };
  }
}