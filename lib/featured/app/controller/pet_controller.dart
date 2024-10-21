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
  var fileImage = Rx<File?>(null);
  final nameCtr = TextEditingController();
  final typeCtr = TextEditingController();
  final priceCtr = TextEditingController();
  final qtyCtr = TextEditingController();
  final detailCtr = TextEditingController();

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
      final product = Pet(
        name: nameCtr.text.trim(),
        type: typeCtr.text.trim(),
        price: double.parse(priceCtr.text.trim()),
        qty: int.parse(qtyCtr.text.trim()),
        image: fileImage.value.toString(),
        description: detailCtr.text.trim(),
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
  }

  Future<void> selectImage() async {
    fileImage.value = await pickImage();
    update();
  }
}
