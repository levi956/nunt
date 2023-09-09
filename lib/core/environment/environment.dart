class EnvironmentSetup {
  static void run({required Environment environment}) {
    env = environment;
  }

  static String get baseUrl => env == Environment.live ? _liveUrl : _testUrl;
  static String get envString => env == Environment.live ? "Live" : "Staging";

  static late Environment env;
  static final String _liveUrl = "https://newsapi.org/v2/".trim();
  static final String _testUrl = "https://newsapi.org/v2/".trim();
}

enum Environment { live, test }
