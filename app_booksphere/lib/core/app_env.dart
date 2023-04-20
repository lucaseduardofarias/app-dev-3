abstract class AppEnv {
  static const bool logDio = bool.fromEnvironment("log_dio");
  static const String apiBaseUrl = String.fromEnvironment('api_base_url',
      defaultValue: "https://comempdev.furnas.com.br/comemp/api/");
}
