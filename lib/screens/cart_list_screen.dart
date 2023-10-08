import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app2/bloc/add_to_cart_bloc/add_to_cart_bloc.dart';
import 'package:interview_app2/bloc/add_to_cart_bloc/add_to_cart_event.dart';
import 'package:interview_app2/bloc/add_to_cart_bloc/add_to_cart_state.dart';
import 'package:interview_app2/models/products.dart';

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

class CartScreen extends StatelessWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      if (state.cartItems.isEmpty) {
        return const Center(
          child: Text('Your cart is empty!'),
        );
      } else {
        double totalPrice = calculateTotalPrice(state.cartItems);
        double deliveryFee = totalPrice * 0.05;
        String formattedDeliveryFee = deliveryFee.toStringAsFixed(2);

        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: AppBar(
              elevation: 0,
              backgroundColor: const Color.fromARGB(255, 251, 249, 249),
              centerTitle: true,
              title: const Padding(
                padding: EdgeInsets.fromLTRB(0, 33, 0, 0),
                child: Text(
                  'Order',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state.cartItems.isEmpty) {
                      return const Center(
                        child: Text('Your cart is empty!'),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: state.cartItems.length,
                        itemBuilder: (context, index) => Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                              child: Image.asset(
                                state.cartItems[index].image,
                                scale: 3,
                              ),
                            ),
                            Text(
                              '${state.cartItems[index].count} x',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 130, 0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 105,
                                    child: Text(
                                      state.cartItems[index].name,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '\$${state.cartItems[index].price}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 10),
                            BlocProvider(
                              create: (context) => CounterBloc(),
                              child: BlocBuilder<CounterBloc, CounterState>(
                                builder: (context, counterState) {
                                  return IconButton(
                                    icon: const Icon(
                                      Icons.close,
                                    ),
                                    onPressed: () {
                                      final cartBloc = context.read<CartBloc>();

                                      cartBloc.add(RemoveFromCart(
                                          state.cartItems[index],
                                          state.cartItems[index].count));
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                    child: Image.asset(
                      'assets/images/Delivery.png',
                      scale: 2,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 30, 20),
                    child: Text(
                      'Delivery',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(230, 0, 0, 0),
                    child: Text(
                      '\$$formattedDeliveryFee',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              const SizedBox(width: 10),
              _CartTotal(),
            ],
          ),
        );
      }
    });
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        double totalPrice = calculateTotalPrice(state.cartItems);
        double deliveryFee = totalPrice * 0.05;
        double totalPriceWithDelivery = totalPrice + deliveryFee;

        String formattedTotalPriceWithDelivery =
            totalPriceWithDelivery.toStringAsFixed(2);
        String formattedTotalPrice = totalPrice.toStringAsFixed(2);

        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '\$$formattedTotalPrice',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(children: [
                  const Text(
                    'CHECKOUT',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(width: 310),
                  Text(
                    '\$$formattedTotalPriceWithDelivery',
                    style: const TextStyle(color: Colors.black),
                  ),
                ]),
                onPressed: () {
                  _showConfirmationDialog(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

Future<void> _showConfirmationDialog(BuildContext context) async {
  final cartBloc = BlocProvider.of<CartBloc>(context);

  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirm Order'),
        content: const Text(
            'Are you sure you want to confirm your order and clear the cart?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return TextButton(
                child: const Text('Confirm'),
                onPressed: () {
                  cartBloc.add(ConfirmOrderAndClearCart());
                  Navigator.of(context).pop();
                  _showOrderConfirmedDialog(context);
                },
              );
            },
          ),
        ],
      );
    },
  );
}

Future<void> _showOrderConfirmedDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Order Confirmed'),
        content: const Text('Your order has been confirmed.'),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
