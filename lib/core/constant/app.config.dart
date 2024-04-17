// ignore_for_file: constant_identifier_names

class AppConfig {
  static const DB_URL = String.fromEnvironment("DATABASE_URL");
  static const DB_KEY = String.fromEnvironment("DATABASE_KEY");
}
