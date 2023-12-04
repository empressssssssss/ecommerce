import 'package:test/test.dart';

class Product {
  final double price;
  final int count;

  Product(this.price, this.count);
}

double calculateTotalPrice(List<Product> cartItems) {
  double totalPrice = 0.0;
  for (var product in cartItems) {
    totalPrice += product.price * product.count;
  }
  return totalPrice;
}

double calculateTotalPriceWithDelivery(
    List<Product> cartItems, double deliveryCharge) {
  double totalPrice = calculateTotalPrice(cartItems);
  return totalPrice + deliveryCharge;
}

void main() {
  group('Cart Total Calculation Tests', () {
    test('calculateTotalPrice returns correct total price', () {
      final List<Product> products = [
        Product(10.0, 2),
        Product(15.0, 3),
      ];

      expect(calculateTotalPrice(products), equals(10.0 * 2 + 15.0 * 3));
    });

    test('calculateTotalPriceWithDelivery returns correct total price with delivery charge', () {
      final List<Product> products = [
        Product(10.0, 2),
        Product(15.0, 3),
      ];
      final double deliveryCharge = 5.0;

      final totalPriceWithoutDelivery = calculateTotalPrice(products);
      final totalPriceWithDelivery = calculateTotalPriceWithDelivery(products, deliveryCharge);

      expect(totalPriceWithDelivery, equals(totalPriceWithoutDelivery + deliveryCharge));
    });
  });
}
