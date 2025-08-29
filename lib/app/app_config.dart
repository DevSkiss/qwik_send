class AppConfig {
  AppConfig({required this.apiUrl, this.apikey, this.showLogs = false});

  final String apiUrl;
  final String? apikey;
  final bool showLogs;
}
