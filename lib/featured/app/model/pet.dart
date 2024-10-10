// model
class Pet {
  int id;
  String name;
  String type;
  double price;
  int qty;
  String image;
  String description;

  Pet({
    required this.id,
    required this.name,
    required this.type,
    required this.price,
    required this.qty,
    required this.image,
    required this.description,
  });

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "type": type,
        "price": price,
        "qty": qty,
        "image": image,
        "description": description,
      };
  factory Pet.fromMap(Map<String, dynamic> map) => Pet(
        id: map["id"],
        name: map["name"],
        type: map["type"],
        price: map["price"],
        qty: map["qty"],
        image: map["image"],
        description: map["description"],
      );
}
