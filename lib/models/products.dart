class Product {
  final int id;
  final String name;
  final double price;
  final String image;
  int count;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.count = 0,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      image: json['image'],
    );
  }
}
