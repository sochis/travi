enum AppEnvironment { development, staging, production }

class EnvConfig {
  final String baseUrl;
  final bool enableLogging;

  const EnvConfig({required this.baseUrl, required this.enableLogging});
}

// Example environment config map
const Map<AppEnvironment, EnvConfig> environmentConfigs =
    <AppEnvironment, EnvConfig>{
      AppEnvironment.development: EnvConfig(
        baseUrl: 'https://dev.example.com/api',
        enableLogging: true,
      ),
      AppEnvironment.staging: EnvConfig(
        baseUrl: 'https://staging.example.com/api',
        enableLogging: true,
      ),
      AppEnvironment.production: EnvConfig(
        baseUrl: 'https://example.com/api',
        enableLogging: false,
      ),
    };
