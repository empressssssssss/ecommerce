class Product {
  final int id;
  final String name;
  final double price;
  //int quantity;
  final String image;
  int count;

  Product({
    required this.id,
    required this.name,
    required this.price,
    //this.quantity = 0,
    required this.image,
    this.count = 0,
  });
}
