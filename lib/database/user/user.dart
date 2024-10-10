import 'dart:developer';

import 'package:sqflite/sqflite.dart';

class UserDatabase {
  final String dbName = "user.db";
  final String tableName = "users";
  final String colId = "id";
  final String colUsername = "username";
  final String colPassword = "password";

  Future<Database> init() async {
    final path = await getDatabasesPath();
    Database db;
    try {
      db = await openDatabase(
        "$path/$dbName",
        version: 1,
        onCreate: (db, version) async => db.execute(
            "CREATE TABLE $tableName ($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colUsername TEXT NOT NULL, $colPassword TEXT NOT NULL)"),
      );
      return db;
    } catch (e) {
      log("Exception on creating database by : $e");
      rethrow;
    }
  }
}
