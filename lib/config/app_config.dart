import 'env.dart';

class AppConfig {
  static AppEnvironment environment = AppEnvironment.development;

  static EnvConfig get current => environmentConfigs[environment]!;
}
