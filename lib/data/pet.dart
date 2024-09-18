// model
class Pet {
  int? id;
  String? name;
  String? type;
  double? price;
  int? qty;
  String? image;
  String? description;

  Pet({
    this.id,
    this.name,
    this.type,
    this.price,
    this.qty,
    this.image,
    this.description,
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
        id: map["id"] as int?,
        name: map["name"] as String?,
        type: map["type"] as String?,
        price: map["price"] as double?,
        qty: map["qty"] as int?,
        image: map["image"] as String?,
        description: map["description"] as String?,
      );
}
