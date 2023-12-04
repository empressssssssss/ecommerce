import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:interview_app2/bloc/add_to_cart_bloc/add_to_cart_bloc.dart';
import 'package:interview_app2/bloc/add_to_cart_bloc/add_to_cart_event.dart';
import 'package:interview_app2/bloc/add_to_cart_bloc/add_to_cart_state.dart';
import 'package:interview_app2/models/products.dart';

void main() {
  group('ProductListBloc', () {
    late ProductListBloc productListBloc;

    setUp(() {
      productListBloc = ProductListBloc();
    });

    tearDown(() {
      productListBloc.close();
    });

    test('emits ProductListLoaded when LoadProductsEvent is added', () {
      final List<Product> mockProducts = [
        Product(id: 1, name: 'Product 1', price: 20.0, image: 'assets/images/Italian.png'),
        Product(id: 2, name: 'Product 2', price: 30.0, image: 'assets/images/Italian.png'),
      ];

      blocTest<ProductListBloc, ProductListState>(
        'emits [ProductListLoaded] when LoadProductsEvent is added',
        build: () => productListBloc,
        act: (bloc) {
          bloc.add(LoadProductsEvent());
        },
        expect: () => [ProductListLoaded(products: mockProducts)],
      );
    });

   test('emits ProductListError when LoadProductsEvent fails', () {
  expectLater(
    productListBloc,
    emitsInOrder([ // Expects the bloc to emit in a particular order
      isA<ProductListError>(),
    ]),
  );

  productListBloc.add(LoadProductsEvent());
});


  });
}