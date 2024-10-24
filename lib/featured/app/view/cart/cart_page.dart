import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_app/components/asset_button.dart';
import 'package:pet_app/featured/app/controller/cart_controller.dart';
import 'package:pet_app/featured/app/view/cart/components/cart_comp.dart';
import 'package:pet_app/featured/app/view/home/home_page.dart';
import 'package:pet_app/utils/theme/text_theme.dart';
import 'package:pet_app/utils/types/colors.dart';
import 'package:pet_app/utils/types/fonts.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  final cartController = Get.put(CartController());

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
        title: const PText(text: 'Cart', fontType: Font.medium, size: 24),
        actions: [
          AssetButton(
            text: "Home",
            textColor: PColors.primary,
            onTab: () => Get.to(() => HomePage()),
          ),
        ],
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 32, left: 32, top: 32),
            child: Column(
              children: [
                // recent activity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const PText(text: "Recent activity", size: 16),
                    PText(
                        text: "${cartController.carts.length} items",
                        color: PColors.primary,
                        size: 14),
                  ],
                ),
                // list cart
                const SizedBox(height: 22),
                ...List.generate(
                  cartController.carts.length,
                  (index) => CartComp(
                    onTapDelete: () async =>
                        cartController.deleteProduct(index),
                    cart: cartController.carts[index],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
