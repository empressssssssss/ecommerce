import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app2/bloc/add_to_cart_bloc/add_to_cart_bloc.dart';
import 'package:interview_app2/bloc/add_to_cart_bloc/add_to_cart_event.dart';
import 'package:interview_app2/bloc/add_to_cart_bloc/add_to_cart_state.dart';
import 'package:interview_app2/models/products.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Product> productList = [
      Product(
          id: 1,
          name: 'Boiled Salmon Steak',
          price: 14.20,
          image: 'assets/images/American.png'),
      Product(
          id: 2,
          name: 'Large Hawaiian Pizza Pie',
          price: 15.20,
          image: 'assets/images/Asian.png'),
      Product(
          id: 3,
          name: 'Interpreter',
          price: 10.95,
          image: 'assets/images/Fast_Food.png'),
    ];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Text(
                  'Taxon Title',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              background: Image.asset(
                'assets/images/TaxonTitle.png',
                fit: BoxFit.cover,
              ),
            ),
            pinned: true,
            floating: true,
            snap: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: ListView.builder(
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      final product = productList[index];
                      return Card(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 30, 20),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text(product.name,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                          const SizedBox(height: 10),
                                          const Row(
                                            children: [
                                              Text('Protein',
                                                  style: TextStyle(
                                                      color: Colors.black)),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text('Cabohydrate',
                                                  style: TextStyle(
                                                      color: Colors.black)),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text('Fibre',
                                                  style: TextStyle(
                                                      color: Colors.black)),
                                            ],
                                          ),
                                          const Row(
                                            children: [
                                              Text('26.2 gr',
                                                  style: TextStyle(
                                                      color: Colors.black)),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Text('26.2 gr',
                                                  style: TextStyle(
                                                      color: Colors.black)),
                                              SizedBox(
                                                width: 25,
                                              ),
                                              Text('26.2 gr',
                                                  style: TextStyle(
                                                      color: Colors.black)),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              BlocProvider(
                                                create: (context) =>
                                                    CounterBloc(),
                                                child: BlocBuilder<CounterBloc,
                                                    CounterState>(
                                                  builder:
                                                      (context, counterState) {
                                                    return SizedBox(
                                                      width: 86,
                                                      height: 30,
                                                      child: Material(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        color: Colors
                                                            .grey.shade300,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  10, 0, 0, 0),
                                                          child: Row(
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  context
                                                                      .read<
                                                                          CounterBloc>()
                                                                      .decrement();
                                                                  if (counterState
                                                                          .count ==
                                                                      1) {
                                                                    final cartBloc =
                                                                        context.read<
                                                                            CartBloc>();
                                                                    cartBloc.add(RemoveFromCart(
                                                                        product,
                                                                        product
                                                                            .count));
                                                                  } else {
                                                                    product.count =
                                                                        (counterState.count -
                                                                            1);
                                                                  }
                                                                },
                                                                child:
                                                                    const Icon(
                                                                  Icons.remove,
                                                                  size: 15,
                                                                ),
                                                              ),
                                                              Text(
                                                                '   ${counterState.count}   ',
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  final cartBloc =
                                                                      context.read<
                                                                          CartBloc>();
                                                                  final cartItems =
                                                                      cartBloc
                                                                          .state
                                                                          .cartItems;
                                                                  if (cartItems.any((item) =>
                                                                      item.id ==
                                                                      product
                                                                          .id)) {
                                                                  } else {
                                                                    cartBloc.add(AddToCart(
                                                                        product,
                                                                        product
                                                                            .count));
                                                                  }

                                                                  product.count =
                                                                      (counterState
                                                                              .count +
                                                                          1);
                                                                  context
                                                                      .read<
                                                                          CounterBloc>()
                                                                      .increment();
                                                                },
                                                                child:
                                                                    const Icon(
                                                                  Icons.add,
                                                                  size: 15,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              const SizedBox(width: 40),
                                              Text(
                                                '\$${product.price}',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 50),
                                      Image.asset(
                                        product.image,
                                        scale: 3,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}



