import 'dart:developer';

import 'package:get/get.dart';
import 'package:pet_app/components/loading.dart';
import 'package:pet_app/components/pick_image.dart';
import 'package:pet_app/database/product/product.dart';
import 'package:pet_app/featured/app/model/pet.dart';

class PetController extends GetxController {
  final pets = <Pet>[].obs;
  final db = ProductDatabase();

  Future<void> addProduct() async {
    final product = Pet(
      name: "amzn",
      type: "Cat",
      price: 123.45,
      qty: 1,
      image: "assets/images/pets/amzn.jpg",
      description: "description of the product in the database",
    );
    openLoading();
    if (await db.addProduct(product)) {
      closeLoading();
      log("Successfully added the product");
    } else {
      closeLoading();
      log("Failed to add the product");
    }
  }

  Future<void> selectImage() async {
    final path = await pickImage();
    if (path.isNotEmpty) {
      log("path image: $path");
    }
  }
}
