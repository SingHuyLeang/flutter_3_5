import 'dart:developer';

import 'package:pet_app/featured/authentication/model/user.dart';
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

  Future<bool> login({required User user}) async {
    try {
      final db = await init();
      final respone = await db.rawQuery(
          "SELECT $colId FROM $tableName WHERE $colUsername='${user.username}' AND $colPassword='${user.password}'");
      return respone.isNotEmpty;
    } catch (e) {
      log("Exception on login by : $e");
    }
    return false;
  }

  Future<bool> createAccount({required User user}) async {
    try {
      final db = await init();
      return await db.insert(tableName, user.toMap()) > 0;
    } catch (e) {
      log("Exception on login by : $e");
    }
    return false;
  }
}
