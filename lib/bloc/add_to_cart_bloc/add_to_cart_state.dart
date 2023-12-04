import 'package:interview_app2/models/products.dart';

class CartState {
  final List<Product> cartItems;
  CartState(this.cartItems);
}

class CounterState {
  final int count;

  CounterState(this.count);

  CounterState.initial() : count = 0;
  
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

 /*class CounterState {
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
}*/

abstract class ProductListState {}

class ProductListInitial extends ProductListState {}

class ProductListLoaded extends ProductListState {
  final List<Product> products;

  ProductListLoaded({required this.products});
}

class ProductListError extends ProductListState {
  final String error;

  ProductListError({required this.error});
}
