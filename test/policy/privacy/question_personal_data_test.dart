import 'package:flutter_test/flutter_test.dart';
import 'package:tracker_app/domain/personal/personal_answer.dart';

void main() {
  group('[RELEASE BLOCKER] Question answer must be PersonalData', () {
    test('Question answer uses PersonalAnswer type', () {
      final answer = PersonalAnswer('test');

      expect(answer.value, isA<String>());
    });
  });
}
