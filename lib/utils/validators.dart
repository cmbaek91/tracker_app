class Validators {
  static void validateEmail(String value) {
    if (value.isEmpty) {
      throw ArgumentError('이메일이 비어 있습니다.');
    }

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      throw ArgumentError('유효하지 않은 이메일 형식입니다.');
    }
  }

  static void validatePassword(String value) {
    if (value.isEmpty) {
      throw ArgumentError('비밀번호가 비어 있습니다.');
    }

    if (value.length < 6) {
      throw ArgumentError('비밀번호는 최소 6자 이상이어야 합니다.');
    }
  }

  static void validateNotEmpty(String value, String fieldName) {
    if (value.trim().isEmpty) {
      throw ArgumentError('$fieldName 이(가) 비어 있습니다.');
    }
  }
}
