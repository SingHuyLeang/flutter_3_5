import 'package:get/get.dart';
import 'package:pet_app/featured/app/model/cart.dart';
import 'package:pet_app/featured/app/model/pet.dart';

class CartController extends GetxController {
  final carts = <Cart>[].obs;
  final qty = 0.obs;
  final subTotal = 0.0.obs;

  void addToCart(Pet pet) {
    final cart = Cart(
      id: pet.id!,
      title: pet.name,
      qty: qty.value,
      subTotal: subTotal.value,
      image: pet.image,
    );
    carts.add(cart);
    qty.value = 0;
  }

  void countQty(bool isIncrement, int maxQty, double price) async {
    if (isIncrement) {
      if (qty.value < maxQty) {
        qty.value += 1;
      } else if (qty.value == maxQty) {
        qty.value = maxQty;
      }
    } else if (qty.value > 0) {
      qty.value -= 1;
    }
    subTotal.value = qty.value * price;
    update();
  }

  void deleteProduct(int index) async {
    carts.removeAt(index);
    update();
  }

  bool checkHasInCart(int id) {
    bool isInCart = false;
    for (var element in carts) {
      if (element.id == id) {
        isInCart = true;
      }
    }
    return isInCart;
  }
}
