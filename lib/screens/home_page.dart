import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app2/bloc/add_to_cart_bloc/add_to_cart_bloc.dart';
import 'package:interview_app2/bloc/add_to_cart_bloc/add_to_cart_state.dart';
import 'package:interview_app2/screens/cart_list_screen.dart';
import 'package:interview_app2/screens/category_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: const TabBarView(
          children: [CategoryPage(), CartScreen()],
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 120.0),
          color: const Color.fromARGB(255, 251, 251, 251),
          child: TabBar(
            indicatorColor: const Color.fromARGB(255, 251, 251, 251),
            tabs: [
              const Tab(
                icon: Icon(
                  Icons.home,
                  color: Colors.yellow,
                ),
              ),
              Tab(
                child: Stack(children: [
                  const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.grey,
                  ),
                  Positioned(
                    top: 7,
                    left: 7,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(),
                      child: BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {
                          int count = state.cartItems.length;
                          return Text(
                            '$count',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 5,
                            ),
                            textAlign: TextAlign.center,
                          );
                        },
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
