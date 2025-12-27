import 'env.dart';

class AppConfig {
  final Env env;

  static late AppConfig _instance;

  AppConfig._(this.env);

  static void initialize({required Env env}) {
    _instance = AppConfig._(env);
  }

  static AppConfig get instance => _instance;

  String get apiBaseUrl => env.apiBaseUrl;
  String get gptApiKey => env.gptApiKey;
  bool get analyticsEnabled => env.enableAnalytics;
  bool get isProd => env.environment == AppEnv.prod;
}