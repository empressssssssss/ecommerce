import 'package:bloc/bloc.dart';
import 'package:interview_app2/bloc/add_to_cart_bloc/add_to_cart_event.dart';
import 'package:interview_app2/bloc/add_to_cart_bloc/add_to_cart_state.dart';
import 'package:interview_app2/models/products.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CounterBloc counterBloc = CounterBloc();

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

