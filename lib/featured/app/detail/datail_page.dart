import 'package:flutter/material.dart';
import 'package:pet_app/components/asset_button.dart';
import 'package:pet_app/data/pet.dart';
import 'package:pet_app/featured/app/detail/layouts/detail_body.dart';
import 'package:pet_app/featured/app/detail/layouts/detail_heading.dart';
import 'package:pet_app/utils/types/colors.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.pet});
  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              width: 265,
              text: "Add to cart",
              textSize: 16,
              textColor: PColors.dark,
              isOutlinButton: true,
            ),
            // button cart
            AssetButton(
              width: 80,
              icon: "assets/images/cart.svg",
              color: PColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
