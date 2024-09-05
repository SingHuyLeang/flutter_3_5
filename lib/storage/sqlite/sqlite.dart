import 'package:sqflite/sqflite.dart';

class SQLite {
  final String database = "test.db";
  final String table = "tasks";
  final String id = "id";
  final String task = "task";

  Future<Database> init() async {
    final dir = await getDatabasesPath();
    return openDatabase(
      "$dir/$database",
      version: 1,
      onCreate: (db, version) => db.execute(
          "CREATE TABLE IF NOT EXISTS $table ($id INTEGER PRIMARY KEY AUTOINCREMENT, $task TEXT NOT NULL)"),
    );
  }
}
