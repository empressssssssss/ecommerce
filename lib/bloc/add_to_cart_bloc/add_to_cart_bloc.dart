import 'package:bloc/bloc.dart';
import 'package:interview_app2/bloc/add_to_cart_bloc/add_to_cart_event.dart';
import 'package:interview_app2/bloc/add_to_cart_bloc/add_to_cart_state.dart';
import 'package:interview_app2/models/products.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class CartBloc extends Bloc<CartEvent, CartState> {
  //final CounterBloc counterBloc = CounterBloc();

  CartBloc() : super(CartState([])) {
    on<CartEvent>(_mapEventToState);
  }

  Future<void> _mapEventToState(
      CartEvent event, Emitter<CartState> emit) async {
    if (event is AddToCart) {
      final updatedCart = List<Product>.from(state.cartItems)
        ..add(event.product);
      emit(CartState(updatedCart));
    } else if (event is RemoveFromCart) {
      final updatedCart = List<Product>.from(state.cartItems)
        ..remove(event.product);
      emit(CartState(updatedCart));
    } else if (event is ConfirmOrderAndClearCart) {
      emit(CartState([]));
    }
  }
}

class CounterBloc extends Cubit<CounterState> {
  CounterBloc() : super(CounterState(0));

  void increment() => emit(CounterState(state.count + 1));

  void decrement() {
    if (state > CounterState(0)) {
      emit(state - 1);
    }
  }

  void reset() {
    emit(CounterState(0));
  }
}

//Map<int, CounterBloc> counterBlocs = {};

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  ProductListBloc() : super(ProductListInitial()) {
    on<LoadProductsEvent>(_mapLoadProductsEventToState);
  }

  void _mapLoadProductsEventToState(
    LoadProductsEvent event,
    Emitter<ProductListState> emit,
  ) async {
    try {
      final List<Product> products = await fetchProductData();
      emit(ProductListLoaded(products: products));
    } catch (error) {
      emit(ProductListError(error: error.toString()));
    }
  }
}

Future<List<Product>> fetchProductData() async {
  final response = await http.get(Uri.parse(
      'https://stagingshop.threls.dev/api/products?filter[class]=food&filter[taxons]=pizza'));

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);
    final List<Product> productList =
        jsonData.map((item) => Product.fromJson(item)).toList();
    return productList;
  } else {
    throw Exception('Failed to load product data');
  }
}
//http://192.168.56.1:8080/api/products
//https://stagingshop.threls.dev/api/products?filter[class]=food&filter[taxons]=pizza

