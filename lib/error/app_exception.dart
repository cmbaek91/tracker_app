class AppException implements Exception {
  final String message;
  const AppException(this.message);

  factory AppException.validation(String msg) => AppException(msg);
  factory AppException.state(String msg) => AppException(msg);
  factory AppException.network(String msg) => AppException(msg);
  factory AppException.unknown(String msg) => AppException(msg);
}
