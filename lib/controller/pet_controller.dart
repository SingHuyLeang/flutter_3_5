import 'package:get/get.dart';
import 'package:pet_app/data/pet.dart';

class PetController extends GetxController {
  final pets = <Pet>[
    Pet(
      id: 1,
      name: "Golden Cavalier",
      price: 340.0,
      qty: 4,
      type: "Dog",
      image: "assets/images/pets/golden.jpg",
      description:
          "Golden gru disposition of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child",
    ),
    Pet(
      id: 2,
      name: "Siberian Husky ",
      price: 689.0,
      qty: 2,
      type: "Dog",
      image: "assets/images/pets/sky.jpg",
      description:
          "Golden gru disposition of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child",
    ),
    Pet(
      id: 3,
      name: "Hero Smos",
      price: 150.0,
      qty: 1,
      type: "Cat",
      image: "assets/images/pets/smos.jpg",
      description:
          "Golden gru disposition of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child",
    ),
    Pet(
      id: 4,
      name: "Kwos Cavalier",
      price: 240.0,
      qty: 8,
      type: "Cat",
      image: "assets/images/pets/kwoes.jpg",
      description:
          "Golden gru disposition of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child of the child",
    ),
  ].obs;
  
}
