import 'dart:developer';

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

  Future<bool> addNote(String note) async {
    int i = 0;
    try {
      final db = await init();
      i = await db.insert(table, {task: note});
    } on DatabaseException catch (e) {
      log('error adding note : $e');
    }
    return i > 0;
  }
}
