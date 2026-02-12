import 'dart:io';

class DatabaseMigrations {
  static Future<String> allMigrations = loadMigrationScript(3);
}

Future<String> loadMigrationScript(int version) async {
  final file = File(
      '${Directory.current.path}/lib/src/db/migrations/001_initial.sql',);
  if (!file.existsSync()) {
    throw Exception('Migration file for version $version not found');
  }
  return file.readAsString();
}
