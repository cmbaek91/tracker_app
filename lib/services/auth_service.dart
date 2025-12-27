import 'dart:async';
import '../error/app_exception.dart';

class AuthService {
  String? _token;
  String? _userId;

  bool get isAuthenticated => _token != null && _userId != null;
  String get userId {
    if (_userId == null) {
      throw AppException.unauthorized();
    }
    return _userId!;
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(milliseconds: 800));

    if (email.isEmpty || password.isEmpty) {
      throw AppException.validation('이메일 또는 비밀번호가 비어있습니다.');
    }

    if (!email.contains('@') || password.length < 6) {
      throw AppException.unauthorized();
    }

    _token = 'access-token-${DateTime.now().millisecondsSinceEpoch}';
    _userId = email;
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _token = null;
    _userId = null;
  }

  Future<void> restoreSession() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _token = null;
    _userId = null;
  }
}
