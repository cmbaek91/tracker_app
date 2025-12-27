import 'app_exception.dart';

class ErrorMapper {
  static AppException map(Object error) {
    if (error is AppException) {
      return error;
    }

    if (error is FormatException) {
      return ValidationException(
        message: '입력 형식이 올바르지 않습니다.',
        cause: error,
      );
    }

    if (error is Exception) {
      return UnknownAppException(
        message: '알 수 없는 오류가 발생했습니다.',
        cause: error,
      );
    }

    return UnknownAppException(
      message: '정의되지 않은 오류 타입입니다.',
      cause: error,
    );
  }
}