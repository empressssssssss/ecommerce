import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app2/models/products.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddToCart extends CartEvent {
  final Product product;
  final int count;

  AddToCart(this.product, this.count);

  @override
  List<Object> get props => [product, count];
}

class RemoveFromCart extends CartEvent {
  final Product product;
  final int count;

  RemoveFromCart(this.product, this.count);

  @override
  List<Object> get props => [product, count];
}

//class ResetCount extends CartEvent {}


class ConfirmOrderAndClearCart extends CartEvent {
 

}


class IncreaseProductQuantity extends CartEvent {
  final Product product;

  IncreaseProductQuantity(this.product);

  @override
  List<Object> get props => [product];
}

class DecreaseProductQuantity extends CartEvent {
  final Product product;

  DecreaseProductQuantity(this.product);

  @override
  List<Object> get props => [product];
}

class ResetProductQuantity extends CartEvent {
  final Product product;

  ResetProductQuantity(this.product);

  @override
  List<Object> get props => [product];
}



class CounterEvent extends Cubit<int> {
  final Product product;
  final int count;

  CounterEvent(this.product, this.count) : super(0);

  List<Object> get props => [product, count];
}

abstract class ProductListEvent {}

class LoadProductsEvent extends ProductListEvent {}