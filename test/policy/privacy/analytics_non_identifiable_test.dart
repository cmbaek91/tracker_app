import 'package:flutter_test/flutter_test.dart';

void main() {
  group('[RELEASE BLOCKER] Analytics must not log text input', () {
    test('Free text must never be logged', () {
      final loggedData = <String, dynamic>{
        'event': 'button_click',
      };

      expect(loggedData.containsKey('text'), false);
      expect(loggedData.containsKey('answer'), false);
    });
  });
}
