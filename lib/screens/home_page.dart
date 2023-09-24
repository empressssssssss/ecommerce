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
    

    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: const TabBarView(
            children: [
              CategoryPage(),
            ],
          ),
          bottomNavigationBar: Container(
            color: Colors.white,
            child: TabBar(
              tabs: [
                const Tab(
                  icon: Icon(
                    Icons.home,
                    color: Colors.yellow,
                  ),
                ),
                Tab(
                  child: BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                    int count = state.cartItems.length;
                    return Stack(children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => CartScreen(
                                cartItems: state.cartItems,
                               
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.shopping_cart_outlined),
                        color: Colors.grey,
                      ),
                      Positioned(
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: const BoxConstraints(
                            minHeight: 15,
                            minWidth: 10,
                          ),
                          child: Text(
                            '$count',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ]);
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
