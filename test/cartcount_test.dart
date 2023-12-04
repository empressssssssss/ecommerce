import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interview_app2/bloc/add_to_cart_bloc/add_to_cart_bloc.dart';
import 'package:interview_app2/bloc/add_to_cart_bloc/add_to_cart_event.dart';
import 'package:interview_app2/bloc/add_to_cart_bloc/add_to_cart_state.dart';
import 'package:interview_app2/models/products.dart';
import 'package:interview_app2/screens/home_page.dart';

void main() {
  testWidgets('Cart count widget test', (WidgetTester tester) async {
    // Create a mock CartBloc and initialize the state
    final List<Product> initialProducts = [/* Some initial products */];
    final CartState initialState = CartState(initialProducts);
    final cartBloc = CartBloc();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider<CartBloc>.value(
            value: cartBloc,
            child: HomePage(), // Replace ChildWidget with the actual widget containing the provided code
          ),
        ),
      ),
    );

    // Find the Text widget that displays the count
    expect(find.text('${initialProducts.length}'), findsOneWidget);

    // You can add more test cases here based on different states of your app
    // For example, you can test when the state changes and the count updates accordingly

    // Clean up
    cartBloc.close();
  });
}
