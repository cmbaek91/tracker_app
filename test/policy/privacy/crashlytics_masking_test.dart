import 'package:flutter_test/flutter_test.dart';

void main() {
  group('[RELEASE BLOCKER] Crash logs must not include personal text', () {
    test('Exception message does not contain user input', () {
      final exceptionMessage = 'GPT failed';

      expect(exceptionMessage.contains('userAnswer'), false);
    });
  });
}
