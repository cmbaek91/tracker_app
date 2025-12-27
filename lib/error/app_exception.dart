abstract class AppException implements Exception {
  final String message;
  final String code;
  final Object? cause;

  const AppException({
    required this.message,
    required this.code,
    this.cause,
  });

  @override
  String toString() {
    return '$runtimeType(code: $code, message: $message, cause: $cause)';
  }
}

class NetworkException extends AppException {
  const NetworkException({
    required super.message,
    super.cause,
  }) : super(code: 'NETWORK_ERROR');
}

class AuthException extends AppException {
  const AuthException({
    required super.message,
    super.cause,
  }) : super(code: 'AUTH_ERROR');
}

class ValidationException extends AppException {
  const ValidationException({
    required super.message,
    super.cause,
  }) : super(code: 'VALIDATION_ERROR');
}

class GptException extends AppException {
  const GptException({
    required super.message,
    super.cause,
  }) : super(code: 'GPT_ERROR');
}

class UnknownAppException extends AppException {
  const UnknownAppException({
    required super.message,
    super.cause,
  }) : super(code: 'UNKNOWN_ERROR');
}