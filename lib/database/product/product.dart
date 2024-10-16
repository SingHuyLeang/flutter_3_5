import 'dart:developer';

import 'package:sqflite/sqflite.dart';

class ProductDatabase {
  final String dbName = "product.db";
  final String table = "products";
  final String id = "id";
  final String name = "name";
  final String type = "type";
  final String price = "price";
  final String qty = "qty";
  final String image = "image";
  final String description = "description";

  Future<Database> init() async {
    try {
      final path = await getDatabasesPath();
      return await openDatabase(
        "$path/$dbName",
        version: 1,
        onCreate: (db, version) => db.execute('''
        CREATE TABLE $table (
        $id INTEGER PRIMARY KEY AUTOINCREMENT,
        $name VARCHAR(50),
        $type VARCHAR(50),
        $price REAL,
        $qty INTEGER,
        $image TEXT,
        $description TEXT)
        '''),
      );
    } catch (e) {
      log("Database Exception: $e");
      rethrow;
    }
  }
}
