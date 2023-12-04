// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app2/bloc/add_to_cart_bloc/add_to_cart_bloc.dart';
import 'package:interview_app2/bloc/add_to_cart_bloc/add_to_cart_event.dart';
import 'package:interview_app2/bloc/add_to_cart_bloc/add_to_cart_state.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class CustomCircularProgressIndicator extends StatelessWidget {
  final String text;

  const CustomCircularProgressIndicator({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    const double fixedProgress = 0.6;

    return SizedBox(
      height: 30,
      width: 30,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: fixedProgress,
            valueColor: AlwaysStoppedAnimation<Color>(getColor(fixedProgress)),
            backgroundColor: Colors.grey,
            strokeWidth: 3.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Column(
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 7.0,
                  ),
                ),
                const Text(
                  'Cal',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 6.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color getColor(double progress) {
    if (progress > 0.59) {
      return Colors.green;
    } else if (progress >= 0.5 && progress <= 0.58) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListBloc, ProductListState>(
      builder: (context, state) {
        if (state is ProductListLoaded) {
          final products = state.products;

          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 200.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: Text(
                        'Taxon Title',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          'assets/images/TaxonTitle.png',
                          fit: BoxFit.cover,
                        ),
                        Container(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ],
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
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          // final counterBloc = counterBlocs[index];
                          return Card(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 10, 30, 20),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                product.name,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Protein',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 10,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Text(
                                                        '16.2 gr',
                                                        style: TextStyle(
                                                          fontSize: 8,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(width: 10),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Carbohydrate',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                      Text(
                                                        '16.2gr',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 8,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(width: 10),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Fibre',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                      Text(
                                                        '16.2gr',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 8,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(width: 10),
                                                  CustomCircularProgressIndicator(
                                                      text: '10'),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  BlocProvider(
                                                    create: (context) =>
                                                        CounterBloc(),
                                                    child: BlocBuilder<
                                                        CounterBloc,
                                                        CounterState>(
                                                      builder: (context,
                                                          counterState) {
                                                        return SizedBox(
                                                          width: 80,
                                                          height: 27,
                                                          child: Material(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: Colors
                                                                .grey.shade300,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      13,
                                                                      0,
                                                                      0,
                                                                      0),
                                                              child: Row(
                                                                children: [
                                                                  InkWell(
                                                                    onTap: () {
                                                                      context
                                                                          .read<
                                                                              CounterBloc>()
                                                                          .decrement();
                                                                      if (product
                                                                              .count ==
                                                                          0) {
                                                                        final cartBloc =
                                                                            context.read<CartBloc>();
                                                                        cartBloc.add(RemoveFromCart(
                                                                            product,
                                                                            product.count));
                                                                      } else {
                                                                        product
                                                                            .count = (counterState
                                                                                .count -
                                                                            1);
                                                                      }
                                                                    },
                                                                    child:
                                                                        const Icon(
                                                                      Icons
                                                                          .remove,
                                                                      size: 13,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    '   ${product.count}   ',
                                                                    style:
                                                                        const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          11,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      final cartBloc =
                                                                          context
                                                                              .read<CartBloc>();
                                                                      final cartItems = cartBloc
                                                                          .state
                                                                          .cartItems;
                                                                      if (cartItems.any((item) =>
                                                                          item.id ==
                                                                          product
                                                                              .id)) {
                                                                      } else {
                                                                        cartBloc.add(AddToCart(
                                                                            product,
                                                                            product.count));
                                                                      }

                                                                      product.count =
                                                                          (counterState.count +
                                                                              1);

                                                                      context
                                                                          .read<
                                                                              CounterBloc>()
                                                                          .increment();
                                                                    },
                                                                    child:
                                                                        const Icon(
                                                                      Icons.add,
                                                                      size: 13,
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
                                                  const SizedBox(width: 20),
                                                  Text(
                                                    '\$${product.price}',
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 190),
                                          Image.asset(
                                            product.image,
                                            scale: 3,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          );
        } else if (state is ProductListError) {
          return Scaffold(
            body: Center(
              child: Text("Error: ${state.error}"),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
