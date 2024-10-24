import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_app/components/asset_button.dart';
import 'package:pet_app/featured/app/controller/cart_controller.dart';
import 'package:pet_app/featured/app/model/pet.dart';
import 'package:pet_app/featured/app/view/cart/cart_page.dart';
import 'package:pet_app/featured/app/view/detail/layouts/detail_body.dart';
import 'package:pet_app/featured/app/view/detail/layouts/detail_heading.dart';
import 'package:pet_app/utils/types/colors.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key, required this.pet});
  final Pet pet;
  final cartCtr = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              // hero image
              DetialHeading(pet: pet),
              // details
              DetailBody(pet: pet),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // add to cart
              AssetButton(
                onTab: () {
                  if (cartCtr.qty.value > 0) {
                    cartCtr.addToCart(pet);
                  }
                },
                width: 265,
                text: cartCtr.checkHasInCart(pet.id!)
                    ? "Added to cart"
                    : "Add to cart",
                textSize: 16,
                textColor:
                    cartCtr.qty.value <= 0 ? PColors.solid : PColors.dark,
                isOutlinButton: true,
              ),
              // button cart
              AssetButton(
                onTab: () => Get.to(() => CartPage()),
                width: 80,
                icon: "assets/images/cart.svg",
                color: PColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
