import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_app/components/asset_button.dart';
import 'package:pet_app/components/input_field.dart';
import 'package:pet_app/featured/app/controller/pet_controller.dart';
import 'package:pet_app/featured/app/view/form/components/form_upload_img.dart';
import 'package:pet_app/utils/types/colors.dart';

class FormPage extends StatelessWidget {
  FormPage({super.key});

  final controller = Get.put(PetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AssetButton(
          onTab: () => Get.back(),
          icon: 'assets/images/arrow-back.svg',
          iconColor: PColors.dark,
          iconSize: 18,
        ),
        actions: [
          AssetButton(
            text: "Add",
            textColor: PColors.primary,
            onTab: () => controller.addProduct(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            children: [
              // image product
              const FormUploadImg(),
              const SizedBox(height: 67),
              // forms
              InputField(
                controller: TextEditingController(),
                hint: "Pet Name",
              ),
              const SizedBox(height: 16),
              InputField(
                controller: TextEditingController(),
                hint: "Pet Type",
              ),
              const SizedBox(height: 16),
              InputField(
                controller: TextEditingController(),
                hint: "Pet Price",
                icon: "assets/images/usd.svg",
              ),
              const SizedBox(height: 16),
              InputField(
                controller: TextEditingController(),
                hint: "Quantity in store",
              ),
              const SizedBox(height: 16),
              InputField(
                height: 248,
                controller: TextEditingController(),
                hint: "About the Breed",
                alignment: Alignment.topLeft,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
