import 'package:interview_app2/models/products.dart';

class CartState {
  final List<Product> cartItems;
  CartState(this.cartItems);

  
}


class CounterState {
  final int count;
  CounterState(this.count);

   CounterState operator -(int value) {
    return CounterState(count - value);
  }

    bool operator >(CounterState other) {
    return count > other.count;
  }

    CounterState operator +(int value) {
    return CounterState(count + value);
  }
}

