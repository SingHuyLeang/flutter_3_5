import 'dart:developer';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pet_app/components/loading.dart';
import 'package:pet_app/components/pick_image.dart';
import 'package:pet_app/database/product/product.dart';
import 'package:pet_app/featured/app/model/pet.dart';

class PetController extends GetxController {
  final pets = <Pet>[].obs;
  final db = ProductDatabase();
  final nameCtr = TextEditingController();
  final typeCtr = TextEditingController();
  final priceCtr = TextEditingController();
  final qtyCtr = TextEditingController();
  final detailCtr = TextEditingController();
  var fileImage = Rx<File?>(null);

  @override
  void onInit() async {
    await getAllPets();
    super.onInit();
  }

  Future<void> addProduct() async {
    if (nameCtr.text.isEmpty ||
        typeCtr.text.isEmpty ||
        priceCtr.text.isEmpty ||
        qtyCtr.text.isEmpty ||
        detailCtr.text.isEmpty ||
        fileImage.value == null) {
      Get.snackbar("Notification", "All fields are required");
      return;
    } else {
      final tempPet = Pet(
        name: nameCtr.text.trim(),
        type: typeCtr.text.trim(),
        price: double.parse(priceCtr.text.trim()),
        qty: int.parse(qtyCtr.text.trim()),
        image: fileImage.value!.path,
        description: detailCtr.text.trim(),
      );
      openLoading();
      if (await db.addProduct(tempPet)) {
        closeLoading();
        log("Successfully added the product");
        pets.add(tempPet);
        clearInput();
      } else {
        closeLoading();
        log("Failed to add the product");
      }
    }
    update();
  }

  Future<void> selectImage() async {
    fileImage.value = await pickImage();
    update();
  }

  Future<void> getAllPets() async {
    pets.value = await db.getAllProducts();
  }

  void clearInput() {
    nameCtr.clear();
    typeCtr.clear();
    priceCtr.clear();
    qtyCtr.clear();
    detailCtr.clear();
    fileImage.value = null;
  }
}
