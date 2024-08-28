import 'package:flutter/material.dart';

class Product {
  int id;
  String name;
  String image;
  String description;
  double price;
  int quantity;
  double rating;
  List<Color> colors;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.quantity,
    required this.rating,
    required this.colors,
  });


  static final products = <Product> [
    Product(
      id: 1,
      name: 'Air Jordan 5',
      image: 'assets/images/sport-running-shoes.jpg',
      description: 'The iconic Air Jordan 5 is known for its comfortable, breathable, and durable build.',
      price: 150.0,
      quantity: 50,
      rating: 4.5,
      colors: [Colors.blue, Colors.pink, Colors.black],
    ),
    Product(
      id: 2,
      name: 'Air Jordan 1',
      image: 'assets/images/pair-trainers.jpg',
      description: 'The iconic Air Jordan 5 is known for its comfortable, breathable, and durable build.',
      price: 150.0,
      quantity: 50,
      rating: 4.5,
      colors: [Colors.blue, Colors.pink, Colors.black],
    ),
  ];
}