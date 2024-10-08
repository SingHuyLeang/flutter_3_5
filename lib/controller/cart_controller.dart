import 'package:get/get.dart';
import 'package:pet_app/data/cart.dart';

class CartController extends GetxController {
  final carts = <Cart>[
    Cart(
      id: 1,
      title: "Siberian Husky",
      qty: 1,
      subTotal: 340.00,
      image: "assets/images/pets/sky.jpg",
    ),
    Cart(
      id: 1,
      title: "Siberian Husky",
      qty: 1,
      subTotal: 340.00,
      image: "assets/images/pets/sky.jpg",
    ),
    Cart(
      id: 1,
      title: "Siberian Husky",
      qty: 1,
      subTotal: 340.00,
      image: "assets/images/pets/sky.jpg",
    )
  ].obs;
}
