import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_app/database/user/user.dart';
import 'package:pet_app/featured/app/view/home/home_page.dart';
import 'package:pet_app/featured/authentication/model/user.dart';

class UserController extends GetxController {
  // variables
  final ctrUsername = TextEditingController();
  final ctrPass = TextEditingController();
  final ctrConPass = TextEditingController();

  final db = UserDatabase();

  // loggin
  Future<void> login() async {
    if (ctrUsername.text.isNotEmpty && ctrPass.text.isNotEmpty) {
      final response = await db.login(
        user: User(
          username: ctrUsername.text,
          password: ctrPass.text,
        ),
      );

      if (response) {
        Get.to(() => HomePage());
      } else {
        Get.snackbar("Authentication", "Invalid username or password");
      }
    } else {
      Get.snackbar("Authentication", "All fields are required");
      return;
    }
  }

  // create new account
  Future<void> createAccount() async {
    if (ctrUsername.text.isNotEmpty &&
        ctrPass.text.isNotEmpty &&
        ctrConPass.text.isNotEmpty) {
      if (ctrPass.text == ctrConPass.text) {
        final success = await db.createAccount(
          user: User(
            username: ctrUsername.text,
            password: ctrPass.text,
          ),
        );

        Get.snackbar(
          "Security",
          success ? "Account created successfully!" : "Account not created",
        );
        if (success) {
          ctrUsername.clear();
          ctrPass.clear();
          ctrConPass.clear();
          Get.to(() => HomePage());
        }
      } else {
        Get.snackbar("Security", "Passwords do not match");
      }
    } else {
      Get.snackbar("Security", "All fields are required");
      return;
    }
    update();
  }
}
