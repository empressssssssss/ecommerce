import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:interview_app2/bloc/add_to_cart_bloc/add_to_cart_bloc.dart';
import 'package:interview_app2/bloc/add_to_cart_bloc/add_to_cart_event.dart';
import 'package:interview_app2/bloc/add_to_cart_bloc/add_to_cart_state.dart';
import 'package:interview_app2/models/products.dart';


void main() {
  group('CartBloc', () {
    late CartBloc cartBloc;

    setUp(() {
      cartBloc = CartBloc();
    });

    tearDown(() {
      cartBloc.close();
    });

    test('Initial state of CartBloc is empty cart', () {
      expect(cartBloc.state.cartItems, isEmpty);
    });

    blocTest<CartBloc, CartState>(
  'emits CartState with added item when AddToCart event is added',
  build: () => cartBloc,
  act: (bloc) => bloc.add(AddToCart(
    Product(id: 1, name: 'Test Product', price: 10.0, image: 'assets/images/Italian.png'),
    1, // Assuming a count of 1 for the product being added
  )),
  expect: () => [CartState([Product(id: 1, name: 'Test Product', price: 10.0, image: 'assets/images/Italian.png')])],
);

   blocTest<CartBloc, CartState>(
  'emits CartState with item removed when RemoveFromCart event is added',
  build: () => cartBloc,
  seed: () => CartState([
    Product(id: 1, name: 'Test Product', price: 10.0, image: 'assets/images/Italian.png'),
    Product(id: 2, name: 'Another Product', price: 15.0, image: 'assets/images/Italian.png'),
  ]),
  act: (bloc) => bloc.add(RemoveFromCart(Product(id: 1, name: 'Test Product', price: 10.0, image: 'assets/images/Italian.png'),
  1,
  )),
  expect: () => [CartState([Product(id: 2, name: 'Another Product', price: 15.0, image: 'assets/images/Italian.png')])],
);

blocTest<CartBloc, CartState>(
  'emits CartState with empty cart when ConfirmOrderAndClearCart event is added',
  build: () => cartBloc,
  seed: () => CartState([
    Product(id: 1, name: 'Test Product', price: 10.0, image: 'assets/images/Italian.png'),
    Product(id: 2, name: 'Another Product', price: 15.0, image: 'assets/images/Italian.png'),
  ]),
  act: (bloc) => bloc.add(ConfirmOrderAndClearCart()),
  expect: () => [CartState([])],
);
  });
}