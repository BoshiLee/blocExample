import 'dart:async';
import 'package:bloc/bloc.dart';

enum CounterEvent { increment, decrement }

class CounterBLoC extends Bloc<CounterEvent, int> {
  @override
  // TODO: implement initialState
  int get initialState => 0;
  // 1

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    // TODO: implement mapEventToState
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;
      case CounterEvent.decrement:
        yield state - 1;
        break;
    }
  }
}
