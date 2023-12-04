import 'package:flutter_test/flutter_test.dart';
import 'package:interview_app2/bloc/add_to_cart_bloc/add_to_cart_bloc.dart';
import 'package:interview_app2/bloc/add_to_cart_bloc/add_to_cart_state.dart';

void main() {
  group('CounterBloc', () {
    test('increment', () async {
      final bloc = CounterBloc(); // Create an instance of the CounterBloc

      // Initial state verification
      expect(bloc.state, equals(CounterState(0)));

      // Subscribe to the stream
      final subscription = bloc.stream.listen(expectAsync1((state) {
        expect(state, equals(CounterState(1)));
      }, count: 1));

      // Trigger the increment method
      bloc.increment();

      // Wait for the stream to emit
      await Future.delayed(Duration.zero);

      // Cancel the subscription
      await subscription.cancel();

      // Closing the bloc after the test
      bloc.close();
    });
  });
}
