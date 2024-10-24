import 'dart:developer';
import 'package:pet_app/featured/app/model/pet.dart';
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

  Future<bool> addProduct(Pet pet) async {
    try {
      final db = await init();
      return await db.insert(table, pet.toMap()) > 0;
    } catch (e) {
      log("Error adding product: $e");
      rethrow;
    }
  }

  Future<List<Pet>> getAllProducts() async {
    try {
      final db = await init();
      final response = await db.query(table);
      return response.map((data) => Pet.fromMap(data)).toList();
    } catch (e) {
      log("Error getting all products: $e");
    }
    return [];
  }

  Future<bool> updateProduct(Pet pet) async {
    return false;
  }

  Future<bool> deleteProduct(int id) async {
    try {
      final db = await init();
      return await db.delete(
            table,
            where: "${this.id} = ?",
            whereArgs: [id],
          ) >
          0;
    } catch (e) {
      log("Error deleting product: $e");
    }
    return false;
  }
}
