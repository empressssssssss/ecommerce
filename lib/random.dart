/*
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
                                                                        10),             productlistpage

   initialRoute: '/',
        routes: {'/': (context) => const ProductListScreen()},


        //  BlocProvider.of<ProductListBloc>(context).add(LoadProductsEvent());
        // BlocProvider(create: (context) => ProductQuantityBloc({})),
        // BlocProvider<CounterBloc>(create: (_) => CounterBloc()),



Error: Expected a value of type of type 'String', but got one of type 'null'

https://stagingshop.threls.dev/api/products?filter[class]=food&filter[taxons]=pizza



 Row(
                                                children: [
                                                  BlocProvider(
                                                    create: (context) =>
                                                        CounterBloc(),
                                                    child: BlocBuilder<
                                                        CounterBloc,
                                                        CounterState>(
                                                      //  bloc: counterBloc,
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
                                                                      if (counterState
                                                                              .count ==
                                                                          1) {
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
                                                                    '   ${counterState.count}   ',
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



                                                                          BlocBuilder<CounterBloc, CounterState>(
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



                     

                                                                      print(
                                                                          'CartBloc state after increment: ${cartBloc.state.cartItems}');
                                                                      print(
                                                                          'After product.count: ${product.count}');
                                                                      print(
                                                                          'After counterState.count ${counterState.count}');
                                                                      print(
                                                                          'After state.products: ${state.products}');
                                                                      print(
                                                                          'After products: ${products}');          




    test('Reset sets the state to CounterState(0)', () {
      counterBloc.increment(); // Increment to a non-zero count
      counterBloc.reset();
      expect(counterBloc.state, CounterState(0));
    });




 */
  