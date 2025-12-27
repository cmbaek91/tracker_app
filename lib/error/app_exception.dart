/// ================================
/// AppException 표준 정의 (중앙 집중)
/// ================================
///
/// ⚠️ 이 파일은 “이미 사용 중인 호출 코드”에 맞춰
/// 누락된 factory / helper 를 **보완**한 최종본이다.
/// 기존 호출부는 수정하지 않는다.
///
/// 지원하는 정적 생성자:
/// - AppException.from(e)
/// - AppException.validation(message)
/// - AppException.network(message)
/// - AppException.unknown(message)
/// - AppException.unauthorized()
/// - AppException.state(message)
///
/// ================================

abstract class AppException implements Exception {
  final String message;
  final String code;
  final Object? cause;

  const AppException({
    required this.message,
    required this.code,
    this.cause,
  });

  /// ----------------
  /// 공용 변환기
  /// ----------------
  factory AppException.from(Object e) {
    if (e is AppException) return e;

    return UnknownAppException(
      message: '알 수 없는 오류가 발생했습니다.',
      cause: e,
    );
  }

  /// ----------------
  /// Validation
  /// ----------------
  factory AppException.validation(String message) {
    return ValidationException(message: message);
  }

  /// ----------------
  /// Network
  /// ----------------
  factory AppException.network(String message) {
    return NetworkException(message: message);
  }

  /// ----------------
  /// Auth / Unauthorized
  /// ----------------
  factory AppException.unauthorized([String? message]) {
    return AuthException(
      message: message ?? '인증이 필요합니다.',
    );
  }

  /// ----------------
  /// State / Logic
  /// ----------------
  factory AppException.state(String message) {
    return ValidationException(message: message);
  }

  /// ----------------
  /// Unknown
  /// ----------------
  factory AppException.unknown(String message, [Object? cause]) {
    return UnknownAppException(
      message: message,
      cause: cause,
    );
  }

  @override
  String toString() {
    return '$runtimeType(code: $code, message: $message, cause: $cause)';
  }
}

/// ================================
/// Network
/// ================================
class NetworkException extends AppException {
  const NetworkException({
    required super.message,
    super.cause,
  }) : super(code: 'NETWORK_ERROR');
}

/// ================================
/// Auth
/// ================================
class AuthException extends AppException {
  const AuthException({
    required super.message,
    super.cause,
  }) : super(code: 'AUTH_ERROR');
}

/// ================================
/// Validation / State
/// ================================
class ValidationException extends AppException {
  const ValidationException({
    required super.message,
    super.cause,
  }) : super(code: 'VALIDATION_ERROR');
}

/// ================================
/// GPT
/// ================================
class GptException extends AppException {
  const GptException({
    required super.message,
    super.cause,
  }) : super(code: 'GPT_ERROR');
}

/// ================================
/// Unknown
/// ================================
class UnknownAppException extends AppException {
  const UnknownAppException({
    required super.message,
    super.cause,
  }) : super(code: 'UNKNOWN_ERROR');
}