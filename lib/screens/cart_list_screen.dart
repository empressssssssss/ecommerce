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
  final List<Product> cartItems;


  const CartScreen({
    Key? key,
    required this.cartItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 251, 249, 249),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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
                            cartItems[index].image,
                            scale: 3,
                          ),
                        ),
                        Text(
                          '${cartItems[index].count} x',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 30, 0),
                          child: Column(
                            children: [
                              SizedBox(
                                width: 85,
                                child: Text(
                                  cartItems[index].name,
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
                          '\$${cartItems[index].price}',
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
                                icon: const Icon(Icons.cancel_outlined),
                                onPressed: () {

                                  final cartBloc = context.read<CartBloc>();
                                  
                                  cartBloc.add(RemoveFromCart(
                                      state.cartItems[index],
                                      cartItems[index].count));
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
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                child: Text(
                  'Total',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(180, 0, 0, 0),
                child: Text(
                  '\$10.95',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
          const SizedBox(width: 10),
          _CartTotal(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final double deliveryFee = 10.95;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        double totalPrice = calculateTotalPrice(state.cartItems);
        double totalPriceWithDelivery = totalPrice + deliveryFee;

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
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '\$$totalPriceWithDelivery',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'CHECKOUT',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Buying not supported yet.'),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
                                
