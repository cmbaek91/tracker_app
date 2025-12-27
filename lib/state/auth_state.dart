import 'package:flutter/foundation.dart';
import '../services/auth_service.dart';
import '../error/app_exception.dart';

enum AuthStatus {
  uninitialized,
  unauthenticated,
  authenticating,
  authenticated,
  error,
}

class AuthState extends ChangeNotifier {
  final AuthService _authService;

  AuthStatus _status = AuthStatus.uninitialized;
  String? _userId;
  AppException? _error;

  AuthState(this._authService);

  AuthStatus get status => _status;
  String? get userId => _userId;
  AppException? get error => _error;

  bool get isInitialized => _status != AuthStatus.uninitialized;
  bool get isAuthenticated => _status == AuthStatus.authenticated;

  Future<void> initialize() async {
    try {
      _status = AuthStatus.uninitialized;
      _error = null;
      notifyListeners();

      await _authService.restoreSession();

      if (_authService.isAuthenticated) {
        _userId = _authService.userId;
        _status = AuthStatus.authenticated;
      } else {
        _status = AuthStatus.unauthenticated;
      }
    } catch (e) {
      _error = AppException.from(e);
      _status = AuthStatus.error;
    }
    notifyListeners();
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      _status = AuthStatus.authenticating;
      _error = null;
      notifyListeners();

      await _authService.login(
        email: email,
        password: password,
      );

      _userId = _authService.userId;
      _status = AuthStatus.authenticated;
    } catch (e) {
      _error = AppException.from(e);
      _status = AuthStatus.error;
    }
    notifyListeners();
  }

  Future<void> logout() async {
    try {
      await _authService.logout();
    } catch (_) {}

    _userId = null;
    _status = AuthStatus.unauthenticated;
    notifyListeners();
  }
}
