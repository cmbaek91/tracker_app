enum AppEnv {
  dev,
  prod,
}

class Env {
  final AppEnv environment;
  final String apiBaseUrl;
  final String gptApiKey;
  final bool enableAnalytics;

  const Env._({
    required this.environment,
    required this.apiBaseUrl,
    required this.gptApiKey,
    required this.enableAnalytics,
  });

  static const dev = Env._(
    environment: AppEnv.dev,
    apiBaseUrl: 'https://api.dev.example.com',
    gptApiKey: String.fromEnvironment('GPT_API_KEY', defaultValue: ''),
    enableAnalytics: false,
  );

  static const prod = Env._(
    environment: AppEnv.prod,
    apiBaseUrl: 'https://api.example.com',
    gptApiKey: String.fromEnvironment('GPT_API_KEY'),
    enableAnalytics: true,
  );
}